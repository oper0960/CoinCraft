//
//  CoinBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import Domain

protocol CoinDependency: Dependency {
    
}

final class CoinComponent: Component<CoinDependency> {
    fileprivate let cryptoCompareDetailUseCase: CryptoCompareDetailUseCase = {
        return CryptoCompareDetailUseCaseImplement(coinRepository: CoinRepositoryImplement(dataStore: CoinDataStoreImplement()))
    }()
    
    fileprivate let coinMarketCapListUseCase: CoinMarketCapListUseCase = {
        return CoinMarketCapListUseCaseImplement(coinRepository: CoinRepositoryImplement(dataStore: CoinDataStoreImplement()))
    }()
}

extension CoinComponent: CoinDetailDependency {
    
}

// MARK: - Builder

protocol CoinBuildable: Buildable {
    func build(withListener listener: CoinListener) -> CoinRouting
}

final class CoinBuilder: Builder<CoinDependency>, CoinBuildable {
    override init(dependency: CoinDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CoinListener) -> CoinRouting {
        let component = CoinComponent(dependency: dependency)
        let viewController = CoinViewController()
        let interactor = CoinInteractor(presenter: viewController, cryptoCompareDetailUseCase: component.cryptoCompareDetailUseCase, coinMarketCapListUseCase: component.coinMarketCapListUseCase)
        interactor.listener = listener
        let detailBuilder = CoinDetailBuilder(dependency: component)
        return CoinRouter(interactor: interactor, viewController: viewController, coinDetailBuilder: detailBuilder)
    }
}
