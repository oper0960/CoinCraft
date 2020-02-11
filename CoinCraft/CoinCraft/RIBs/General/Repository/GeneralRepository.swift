//
//  GeneralRepository.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol GeneralRepository {
    func getActiveList()
    func getUpComingList()
}

enum GeneralRepoType {
    case remote, local
}

class GeneralRepositoryFactory {
    static func create(type: GeneralRepoType) -> GeneralRepository {
        switch type {
        case .remote:
            return RemoteGeneralRepository()
        case .local:
            return LocalGeneralRepository()
        }
    }
}

class RemoteGeneralRepository: GeneralRepository {
    func getActiveList() {
        
    }
    
    func getUpComingList() {
        
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalGeneralRepository: GeneralRepository {
    func getActiveList() {
        
    }
    
    func getUpComingList() {
        
    }
}
