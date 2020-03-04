//
//  MiningBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import Domain

protocol MiningDependency: Dependency {
    // TODO: 부모 RIB에서 해당 RIB으로 전달 받아야할 데이터를 구현
}

final class MiningComponent: Component<MiningDependency> {
    // TODO: 해당 RIB에서만 사용되는 Dependency를 fileprivate 으로 선언
    fileprivate let miningUseCase: MiningUseCase = {
       return MiningUseCaseImplement(miningRepository: MiningRepositoryImplement(dataStore: MiningDataStoreImplement()))
    }()
}

// MARK: - Builder
protocol MiningBuildable: Buildable {
    func build(withListener listener: MiningListener) -> MiningRouting
}

final class MiningBuilder: Builder<MiningDependency>, MiningBuildable {

    override init(dependency: MiningDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MiningListener) -> MiningRouting {
        let component = MiningComponent(dependency: dependency)
        let viewController = MiningViewController()
        let interactor = MiningInteractor(presenter: viewController, miningUseCase: component.miningUseCase)
        interactor.listener = listener
        return MiningRouter(interactor: interactor, viewController: viewController)
    }
}
