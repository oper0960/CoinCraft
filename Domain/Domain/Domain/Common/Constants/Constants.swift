//
//  Constants.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

public struct Constants {
    
    private struct Key {
        static let cryptoCompareKey = "5f8a6d771949191aed7a988ab7dbdc3adb1d569099b2f00da51bb2748c71fc17"
    }
    
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
        
        public struct Mining {
            private static let baseUrl = "https://min-api.cryptocompare.com"
            public static let list = "\(baseUrl)/data/mining/pools/general?api_key=\(Constants.Key.cryptoCompareKey)"
        }
    }
    
    public struct About {
        
    }
}
