//
//  CoinMarketCapUseCase.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 실제로 사용 될 데이터를 가공하고 가공된 데이터를 전달

public protocol CoinMarketCapListUseCase {
    func getCoinMarketCapList() -> Observable<[CoinMarketCapViewModel]>
}
