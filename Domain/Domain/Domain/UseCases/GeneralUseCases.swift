//
//  GeneralUseCases.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/26.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

public protocol NewsUseCases {
    func getNewsList<T>(complete: @escaping ([T]) -> (Void))
}
