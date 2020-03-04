//
//  MiningRepositoryImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import RxSwift
import Domain

struct MiningRepositoryImplement: MiningRepository {
    
    private let dataStore: MiningDataStore
    
    init(dataStore: MiningDataStore) {
        self.dataStore = dataStore
    }
    
    func getMiningList() -> Observable<[MiningViewable]> {
        return dataStore.getMiningList()
    }
}
