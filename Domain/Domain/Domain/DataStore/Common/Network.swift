//
//  Network.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/27.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

public typealias DictionaryType = [String: String]
public typealias HeadersType = [String: String]

public enum NetworkServiceError: Error {
    case statusError(code: Int)
    case decodeError
}

public class Network {
    
    // MARK: - RxAlamofire
    public static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType) -> Observable<T> {
        return RxAlamofire.requestData(method, URL(string: reqURL)!,
                                       parameters: parameters,
                                       encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                                       headers: headers)
            .filter { response, _ in return statusCodeValidation(response) }
            .map { _ , data in
                do  {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkServiceError.decodeError
                }
        }
    }
    
    public static func statusCodeValidation(_ response: HTTPURLResponse) -> Bool {
        guard response.statusCode != 200 else { return response.statusCode == 200 }
        
        return response.statusCode != 200
    }
}

public struct Constant {
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
