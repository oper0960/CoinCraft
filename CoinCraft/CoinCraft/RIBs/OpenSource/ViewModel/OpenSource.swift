//
//  OpenSource.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

struct OpenSource {
    var opensourceName: String
    var license: License
    
    init(_ opensourceName: String, license: License) {
        self.license = license
        self.opensourceName = opensourceName
    }
}

enum License {
    case mit(year: String, name: String)
    case apache2
    
    var licenseTitle: String {
        switch self {
        case .mit(_, _):
            return "MIT License"
        case .apache2:
            return "Apache License 2.0"
        }
    }
    
    var licenseText: String {
        guard let text = getText else { return "" }
        
        switch self {
        case .mit(let year, let name):
            var changeText = text
            let dictionary = [ "<YEAR>": year, "<COPYRIGHT>": name ]
            for value in dictionary {
                changeText = changeText.replacingOccurrences(of: value.key, with: value.value)
            }
            return changeText
        default:
            return text
        }
    }
    
    private var getText: String? {
        
        var name: String {
            switch self {
            case .mit(_, _):
                return "MIT"
            case .apache2:
                return "Apache2.0"
            }
        }
        guard let path = Bundle.main.path(forResource: name, ofType: "txt") else { return nil }
        return try? String(contentsOfFile: path)
    }
}
