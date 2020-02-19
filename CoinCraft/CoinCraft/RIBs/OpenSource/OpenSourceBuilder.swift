//
//  OpenSourceBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol OpenSourceDependency: Dependency {
    var navigation: UINavigationController { get }
    var openSourceStream: OpenSourceStream { get }
}

final class OpenSourceComponent: Component<OpenSourceDependency> {
    var navigation: UINavigationController {
        return dependency.navigation
    }
    
    fileprivate let openSourceList: [OpenSource] = {
        var array = [OpenSource]()
        array.append(OpenSource("RIBs", license: .apache2))
        array.append(OpenSource("lottie-ios", license: .apache2))
        array.append(OpenSource("RxSwift", license: .mit(year: "2015", name: "Krunoslav Zaher")))
        array.append(OpenSource("SnapKit", license: .mit(year: "2011", name: "SnapKit Team")))
        array.append(OpenSource("Alamofire", license: .mit(year: "2018", name: "Alamofire Software Foundation")))
        array.append(OpenSource("SwiftyJSON", license: .mit(year: "2017", name: "Ruoyu Fu")))
        array.append(OpenSource("Kingfisher", license: .mit(year: "2019", name: "Wei Wang")))
        return array
    }()
}

extension OpenSourceComponent: LicenseTextDependency {
    var openSourceStream: OpenSourceStream {
        return dependency.openSourceStream
    }
}

// MARK: - Builder
protocol OpenSourceBuildable: Buildable {
    func build(withListener listener: OpenSourceListener) -> OpenSourceRouting
}

final class OpenSourceBuilder: Builder<OpenSourceDependency>, OpenSourceBuildable {

    override init(dependency: OpenSourceDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OpenSourceListener) -> OpenSourceRouting {
        let component = OpenSourceComponent(dependency: dependency)
        let viewController = OpenSourceViewController(navigation: component.navigation, openSourceList: component.openSourceList)
        let interactor = OpenSourceInteractor(presenter: viewController, openSourceStream: component.openSourceStream)
        
        let licenseBuilder = LicenseTextBuilder(dependency: component)
        
        interactor.listener = listener
        return OpenSourceRouter(interactor: interactor, viewController: viewController, licenseTextBuilder: licenseBuilder)
    }
}
