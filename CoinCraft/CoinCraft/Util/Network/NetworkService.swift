//
//  NetworkService.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias DictionaryType = [String: String]
typealias HeadersType = [String: String]

class NetworkService {
    static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType, failed: ((String) -> (Void))? = nil, success: @escaping (T) -> (Void)) {
        
        #if DEBUG
        print("전송 URL :",reqURL)
        print("전송 파라미터 :",parameters)
        print("전송 헤더 :",headers)
        #endif
        
        Alamofire.request(reqURL, method: method, parameters: parameters,
                          encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                          headers: headers).validate().responseData{ response in
                            switch response.result{
                            case .success:
                                if let data = response.data {
                                    do {
//                                        print(JSON(data))
                                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                                        success(decodedData)
                                    } catch let error {
                                        print(error)
                                    }
                                }
                            case .failure:
                                failed?(response.error!.localizedDescription)
                                print("error : \(response.error!.localizedDescription)")
                            }
        }
    }
    
    static func progressRequest<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType, failed: ((String) -> (Void))? = nil, success: @escaping (T) -> (Void)) {
            
            #if DEBUG
            print("전송 URL :",reqURL)
            print("전송 파라미터 :",parameters)
            print("전송 헤더 :",headers)
            #endif
            
            Alamofire.request(reqURL, method: method, parameters: parameters,
                              encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                              headers: headers).downloadProgress(closure: { pregress in
                                print(pregress.fractionCompleted)
                              }).validate().responseData{ response in
                                switch response.result{
                                case .success:
                                    if let data = response.data {
                                        do {
                                            let decodedData = try JSONDecoder().decode(T.self, from: data)
                                            success(decodedData)
                                        } catch let error {
                                            print(error)
                                        }
                                    }
                                case .failure:
                                    failed?(response.error!.localizedDescription)
                                    print("error : \(response.error!.localizedDescription)")
                                }
            }
        }
}

struct Constants {
    struct CoinMarketCap {
        private static let BaseUrl = "https://api.coinmarketcap.com"
        static let imageBaseUrl = "https://chasing-coins.com/api/v1/std/logo/"
        static let list = "\(BaseUrl)/v1/ticker/?limit=0"
    }
    
    struct CryptoCompare {
        private static let BaseUrl = "https://min-api.cryptocompare.com"
        static let list = "\(BaseUrl)/data/all/coinlist"
    }
}
