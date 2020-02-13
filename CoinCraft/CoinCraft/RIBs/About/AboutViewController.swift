//
//  AboutViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol AboutPresentableListener: class {
    
}

final class AboutViewController: UIViewController {

    weak var listener: AboutPresentableListener?
    
    @IBOutlet weak var aboutTableView: UITableView!
    
    private enum SettingMenu {
        case opensource, version, feedback
    }
    
    private var menuArray: [SettingMenu] = {
        var array = [SettingMenu]()
        array.append(.opensource)
        array.append(.version)
        array.append(.feedback)
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
}

// MARK: - Setup
extension AboutViewController {
    private func setTableView() {
        aboutTableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
        aboutTableView.delegate = self
        aboutTableView.dataSource = self
    }
}

// MARK: - AboutPresentable
extension AboutViewController: AboutPresentable {
    
}

// MARK: - AboutViewControllable
extension AboutViewController: AboutViewControllable {
    
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
        
        
        
        
        return settingCell
    }
}
