//
//  Constants.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

public struct Constants {
    public struct Coin {
        public struct CoinMarketCap {
            private static let BaseUrl = "https://api.coinmarketcap.com"
            public static let imageBaseUrl = "https://chasing-coins.com/api/v1/std/logo/"
            public static let list = "\(BaseUrl)/v1/ticker/?limit=0"
        }
        
        public struct CryptoCompare {
            private static let BaseUrl = "https://min-api.cryptocompare.com"
            private static let detailBaseUrl = "https://www.cryptocompare.com"
            public static let list = "\(BaseUrl)/data/all/coinlist"
            public static let detail = "\(detailBaseUrl)/api/data/coinsnapshotfullbyid"
        }
    }
    
    public struct General {
        public struct News {
            private static let baseUrl = "https://min-api.cryptocompare.com"
            public static let list = "\(baseUrl)/data/v2/news/?lang=EN"
        }
        
        public struct Social {
            private static let baseUrl = "https://min-api.cryptocompare.com"
            public static let list = "\(baseUrl)"
        }
    }
    
    public struct About {
        
    }
}
