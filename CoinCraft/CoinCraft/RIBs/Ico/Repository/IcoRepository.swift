//
//  IcoRepository.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol IcoRepository {
    func getActiveList()
    func getUpComingList()
}

enum IcoRepoType {
    case remote, local
}

class IcoRepositoryFactory {
    static func create(type: IcoRepoType) -> IcoRepository {
        switch type {
        case .remote:
            return RemoteIcoRepository()
        case .local:
            return LocalIcoRepository()
        }
    }
}

class RemoteIcoRepository: IcoRepository {
    func getActiveList() {
        
    }
    
    func getUpComingList() {
        
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalIcoRepository: IcoRepository {
    func getActiveList() {
        
    }
    
    func getUpComingList() {
        
    }
}
