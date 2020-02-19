//
//  OpenSourceViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxCocoa
import RxSwift
import UIKit

protocol OpenSourcePresentableListener: class {
    func getOpenSourceList()
    func getOpenSource(row: Int)
}

final class OpenSourceViewController: UIViewController {
    
    private var navigation: UINavigationController
    private let openSourceList: [OpenSource]
    private var selecteRelay = PublishRelay<OpenSource>()
    
    init(navigation: UINavigationController,
         openSourceList: [OpenSource]) {
        self.navigation = navigation
        self.openSourceList = openSourceList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var openSourceTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OpenSource License"
        setTableView()
        setRx()
    }
}

// MARK: - Setup
extension OpenSourceViewController {
    private func setTableView() {
        openSourceTableView.register(UINib(nibName: "OpenSourceCell", bundle: nil), forCellReuseIdentifier: "source")
        openSourceTableView.delegate = self
        openSourceTableView.dataSource = self
    }
    
    private func setRx() {
        openSourceTableView.rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                self.selecteRelay.accept(self.openSourceList[indexPath.row])
            }).disposed(by: disposeBag)
    }
}

// MARK: - OpenSourcePresentable
extension OpenSourceViewController: OpenSourcePresentable {
    func onSelected() -> PublishRelay<OpenSource> {
        return selecteRelay
    }
}


// MARK: - OpenSourceViewControllable
extension OpenSourceViewController: OpenSourceViewControllable {
    func push(viewController: ViewControllable) {
        self.navigation.pushViewController(viewController.uiviewController, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension OpenSourceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openSourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let openSourceCell = tableView.dequeueReusableCell(withIdentifier: "source", for: indexPath) as! OpenSourceCell
        let openSource = openSourceList[indexPath.row]
        openSourceCell.bind(openSource: openSource)
        return openSourceCell
    }
}


