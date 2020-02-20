//
//  GeneralViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import SafariServices

enum GeneralType: Int {
    case news, social, none
}

protocol GeneralPresentableListener: class {
    func convertIndexToVC(index: GeneralType)
    func getSegmentInfo()
}

final class GeneralViewController: UIViewController {

    weak var listener: GeneralPresentableListener?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var subViewContainer: UIView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listener?.getSegmentInfo()
        
        setRx()
    }
}

// MARK: - Setup
extension GeneralViewController {
    private func setRx() {
        segmentControl.rx
            .selectedSegmentIndex
            .subscribe (onNext: { index in
                self.listener?.convertIndexToVC(index: GeneralType(rawValue: index) ?? .none)
            }).disposed(by: disposeBag)
    }
}

// MARK: - GeneralPresentable
extension GeneralViewController: GeneralPresentable {
    func setSegment(innerViews: [SegmentInnerView]) {
        segmentControl.removeAllSegments()
        for (index, view) in innerViews.enumerated() {
            segmentControl.insertSegment(withTitle: view.name, at: index, animated: false)
        }
        segmentControl.selectedSegmentIndex = 0
    }
    
    func presentSafariViewConrtoller(news: NewsViewModel) {
        guard let url = URL(string: news.url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}

// MARK: - GeneralViewControllable
extension GeneralViewController: GeneralViewControllable {
    func swichingViewController(viewController: ViewControllable) {
        if let subview = subViewContainer.subviews.first {
            if subview.tag != segmentControl.selectedSegmentIndex {
                subview.removeFromSuperview()
                guard let switchingView = viewController.uiviewController.view else { return }
                subViewContainer.addSubview(switchingView)
                switchingView.snp.makeConstraints { make in
                    make.top.equalTo(subViewContainer.snp.top)
                    make.leading.equalTo(subViewContainer.snp.leading)
                    make.trailing.equalTo(subViewContainer.snp.trailing)
                    make.bottom.equalTo(subViewContainer.snp.bottom)
                }
            }
        } else {
            guard let addView = viewController.uiviewController.view else { return }
            subViewContainer.addSubview(addView)
            addView.snp.makeConstraints { make in
                make.top.equalTo(subViewContainer.snp.top)
                make.leading.equalTo(subViewContainer.snp.leading)
                make.trailing.equalTo(subViewContainer.snp.trailing)
                make.bottom.equalTo(subViewContainer.snp.bottom)
            }
        }
    }
}
