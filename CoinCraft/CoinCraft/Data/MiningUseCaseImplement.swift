//
//  MiningUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct MiningUseCaseImplement: MiningUseCase {
    
    private let miningRepository: MiningRepository
    
    init (miningRepository: MiningRepository) {
        self.miningRepository = miningRepository
    }
    
    func getMiningList() -> Observable<[MiningViewable]> {
        return miningRepository.getMiningList()
    }
}
