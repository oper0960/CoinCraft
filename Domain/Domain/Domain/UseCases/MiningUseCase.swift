//
//  MiningUseCase.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import RxSwift

public protocol MiningUseCase {
    func getMiningList() -> Observable<[MiningViewable]>
}
