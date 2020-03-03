//
//  NetworkService.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Alamofire
import RxAlamofire
import RxCocoa
import RxSwift
import SwiftyJSON

typealias DictionaryType = [String: String]
typealias HeadersType = [String: String]

enum NetworkServiceError: Error {
    case statusError(code: Int)
    case decodeError
}

class NetworkService {
    
    // MARK: - RxAlamofire
    static func request<T: Decodable>(method: HTTPMethod, reqURL: String, parameters: DictionaryType, headers: HeadersType) -> Observable<T> {
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
    
    static func statusCodeValidation(_ response: HTTPURLResponse) -> Bool {
        guard response.statusCode != 200 else { return response.statusCode == 200 }
        
        return response.statusCode != 200
    }
    
    // MARK: - Alamofire
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


