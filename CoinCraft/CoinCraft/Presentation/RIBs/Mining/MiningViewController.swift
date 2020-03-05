//
//  MiningViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Domain

protocol MiningPresentableListener: class {
    // TODO: Business Logic의 수행을 위해 Interactor로 호출할 메소드, 프로퍼티를 구현
    func getMinings()
    func selectedWebsite(index: Int)
    func selectedTwitter(index: Int)
}

final class MiningViewController: UIViewController {

    weak var listener: MiningPresentableListener?
    
    @IBOutlet weak var miningTableView: UITableView!
    
    private var minings = [MiningViewable]() {
        didSet {
            miningTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        listener?.getMinings()
    }
}

// MARK: - Setup
extension MiningViewController {
    func setup() {
        miningTableView.register(UINib(nibName: "MiningTableViewCell", bundle: nil), forCellReuseIdentifier: "miningCell")
        miningTableView.delegate = self
        miningTableView.dataSource = self
    }
}
 
// MARK: - MiningPresentable
extension MiningViewController: MiningPresentable {
    func setMinings(minings: [MiningViewable]) {
        self.minings = minings
    }
}

// MARK: - MiningViewControllable
extension MiningViewController: MiningViewControllable {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MiningViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miningCell = tableView.dequeueReusableCell(withIdentifier: "miningCell", for: indexPath) as! MiningTableViewCell
        miningCell.delegate = self
        miningCell.bind(index: indexPath.row, datum: minings[indexPath.row])
        return miningCell
    }
}

extension MiningViewController: MiningCellDelegate {
    func selectedWebsiteButton(index: Int) {
        listener?.selectedWebsite(index: index)
    }
    
    func selectedTwitterButton(index: Int) {
        print(minings[index])
        listener?.selectedTwitter(index: index)
    }
}
