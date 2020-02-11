//
//  GeneralViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

enum GeneralType: Int {
    case active, upcoming, none
}

protocol GeneralPresentableListener: class {
    func convertIndexToVC(index: GeneralType)
    func getSegmentInfo()
}

final class GeneralViewController: UIViewController {

    weak var listener: GeneralPresentableListener?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var subViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listener?.getSegmentInfo()
        listener?.convertIndexToVC(index: .active)
    }
}

// MARK: - Event
extension GeneralViewController {
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        listener?.convertIndexToVC(index: GeneralType(rawValue: sender.selectedSegmentIndex) ?? .none)
    }
}

// MARK: - IcoPresentable
extension GeneralViewController: GeneralPresentable {
    func setSegment(innerViews: [SegmentInnerView]) {
        segmentControl.removeAllSegments()
        for (index, view) in innerViews.enumerated() {
            segmentControl.insertSegment(withTitle: view.name, at: index, animated: false)
        }
        segmentControl.selectedSegmentIndex = 0
    }
}

// MARK: - IcoViewControllable
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