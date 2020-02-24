//
//  NetworkService.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RxAlamofire
import RxCocoa
import RxSwift

typealias DictionaryType = [String: String]
typealias HeadersType = [String: String]

enum NetworkServiceError: Error {
    case statusError
}

class NetworkService {
    
    static private var disposeBag = DisposeBag()
    
    static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType) -> Observable<T> {
        return Observable<T>.create { observer in
            
            guard let url = URL(string: reqURL) else {
                return Disposables.create()
            }
            
            RxAlamofire.requestData(method, url,
                                    parameters: parameters,
                                    encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                                    headers: headers)
                .debug()
                .subscribe(onNext: { (response: HTTPURLResponse, data: Data) in
                    
                    do {
                        let decodableJson = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(decodableJson)
                        observer.onCompleted()
                    } catch let error {
                        observer.onError(error)
                        observer.onCompleted()
                    }
                }, onError: { error in
                    observer.onError(error)
                }, onCompleted: {
                    observer.onCompleted()
                }).disposed(by: disposeBag)
            return Disposables.create()
        }
    }
    
//    static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType) -> Observable<T> {
//        return Observable<T>.create { observer in
//            Alamofire.request(reqURL, method: method, parameters: parameters,
//                              encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
//                              headers: headers)
//                .validate()
//                .responseData{ response in
//                    switch response.result{
//                    case .success:
//                        guard let data = response.data else {
//                            return observer.onCompleted()
//                        }
//
//                        do {
//                            let decodableJson = try JSONDecoder().decode(T.self, from: data)
//                            observer.onNext(decodableJson)
//                            observer.onCompleted()
//                        } catch let error {
//                            observer.onError(error)
//                            observer.onCompleted()
//                        }
//                    case .failure:
//                        observer.onError(response.error!)
//                        observer.onCompleted()
//                        print("error : \(response.error!.localizedDescription)")
//                    }
//            }
//            return Disposables.create()
//        }
//    }
    
    
    
    
    
    
    
    
    static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType, failed: ((String) -> (Void))? = nil, success: @escaping (T) -> (Void)) {
        
        #if DEBUG
        print("전송 URL :",reqURL)
        print("전송 파라미터 :",parameters)
        print("전송 헤더 :",headers)
        #endif
        
        Alamofire.request(reqURL, method: method, parameters: parameters,
                          encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                          headers: headers)
            .validate()
            .responseData{ response in
                switch response.result{
                case .success:
                    if let data = response.data {
                        do {
                            success(try JSONDecoder().decode(T.self, from: data))
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
    
    static func progressRequest<T: Decodable>(method: HTTPMethod,
                                              reqURL: String,
                                              parameters: DictionaryType,
                                              headers: HeadersType,
                                              progressBar: @escaping (Double) -> (Void),
                                              failed: ((String) -> (Void))? = nil,
                                              success: @escaping (T) -> (Void)) {
        
        #if DEBUG
        print("전송 URL :",reqURL)
        print("전송 파라미터 :",parameters)
        print("전송 헤더 :",headers)
        #endif
        
        var header = headers
        header.updateValue("Content-Length", forKey: "Content-Length")
        
        Alamofire.request(reqURL, method: method, parameters: parameters,
                          encoding: method == .get ? URLEncoding(destination: .methodDependent) : JSONEncoding.default,
                          headers: headers)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility), closure: { progress in
                progressBar(progress.fractionCompleted)
            })
            .validate()
            .responseData{ response in
                switch response.result{
                case .success:
                    if let data = response.data {
                        do {
                            success(try JSONDecoder().decode(T.self, from: data))
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
    struct Coin {
        struct CoinMarketCap {
            private static let BaseUrl = "https://api.coinmarketcap.com"
            static let imageBaseUrl = "https://chasing-coins.com/api/v1/std/logo/"
            static let list = "\(BaseUrl)/v1/ticker/?limit=0"
        }
        
        struct CryptoCompare {
            private static let BaseUrl = "https://min-api.cryptocompare.com"
            private static let detailBaseUrl = "https://www.cryptocompare.com"
            static let list = "\(BaseUrl)/data/all/coinlist"
            static let detail = "\(detailBaseUrl)/api/data/coinsnapshotfullbyid"
        }
    }
    
    struct General {
        struct News {
            private static let baseUrl = "https://min-api.cryptocompare.com"
            static let list = "\(baseUrl)/data/v2/news/?lang=EN"
        }
        
        struct Social {
            private static let baseUrl = "https://min-api.cryptocompare.com"
            static let list = "\(baseUrl)"
        }
    }
    
    struct About {
        
    }
}
