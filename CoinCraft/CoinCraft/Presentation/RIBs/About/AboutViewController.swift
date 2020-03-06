//
//  AboutViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import MessageUI

enum SettingMenu {
    case opensource, version, feedback
}

final class AboutViewController: UIViewController {

    private var selectedRelay = PublishRelay<SettingMenu>()
    private var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var aboutTableView: UITableView!
    
    private var menuArray: [SettingMenu] = {
        var array = [SettingMenu]()
        array.append(.opensource)
        array.append(.feedback)
        array.append(.version)
        return array
    }()
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setRx()
    }
}

// MARK: - Setup
extension AboutViewController {
    private func setTableView() {
        aboutTableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
        aboutTableView.delegate = self
        aboutTableView.dataSource = self
    }
    
    private func setRx() {
        aboutTableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.selectedRelay.accept(self.menuArray[indexPath.row])
            }).disposed(by: disposeBag)
    }
    
    private func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["oper0960@gmail.com"])
        return mailVC
    }
}

// MARK: - AboutPresentable
extension AboutViewController: AboutPresentable {
    func onSelected() -> PublishRelay<SettingMenu> {
        return selectedRelay
    }
}

// MARK: - AboutViewControllable
extension AboutViewController: AboutViewControllable {
    func push(viewController: ViewControllable, completion: @escaping (() -> ()) ) {
        self.navigation.pushViewController(viewController.uiviewController, animated: true, completion: completion)
    }
    
    func presentFeedback() {
        let mailVC = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "No account", message: "Required add account to mail app.", preferredStyle: .alert)
            let goMailAppAction = UIAlertAction(title: "Run mail app", style: .default) { (action) in
                guard let url = URL(string: "mailto:") else { return }
                
                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }                                }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(goMailAppAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - MFMailComposeViewController Delegate
extension AboutViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            print(error)
        } else {
            switch result {
            case .sent:
                let alert = UIAlertController(title: "Send complete", message: "Thanks for your opinion.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Done", style: .default) { (action) in
                    controller.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okAction)
                controller.present(alert, animated: true, completion: nil)
            case .failed:
                let alert = UIAlertController(title: "Send failed", message: "Send it again later.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Done", style: .default) { (action) in
                    controller.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okAction)
                controller.present(alert, animated: true, completion: nil)
            case .cancelled, .saved:
                controller.dismiss(animated: true, completion: nil)
            @unknown default:
                fatalError()
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! AboutTableViewCell
        settingCell.bind(menu: menuArray[indexPath.row])
        return settingCell
    }
}
