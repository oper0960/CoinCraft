//
//  LicenseTextViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/14.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

final class LicenseTextViewController: UIViewController {

    private var openSourceRelay = PublishRelay<Void>()
    
    @IBOutlet weak var licenseTextView: UITextView! {
        didSet {
            licenseTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Setup
extension LicenseTextViewController {
    
}

// MARK: - LicenseTextPresentable
extension LicenseTextViewController: LicenseTextPresentable {
    func setLicense(license: OpenSource) {
        title = license.opensourceName
        licenseTextView.text = license.license.licenseText
    }
}

// MARK: - LicenseTextViewControllable
extension LicenseTextViewController: LicenseTextViewControllable {
    
}
