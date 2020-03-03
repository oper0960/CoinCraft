//
//  NewsRepository.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/27.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - UseCase 에서 전달 될 데이터를 Network, Realm, SQLite 등 Data Access 를 통해 받은 데이터를 전달

public protocol NewsRepository {
    func getNewsList() -> Observable<[PaperViewModel]>
}


