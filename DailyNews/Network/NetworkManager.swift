//
//  NetworkManager.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import Alamofire
func convertFromJSONToModelV4<T: Codable>(_ response: DataResponse<Any>, decode: ((_ data: Data) -> T?), failure: (() -> Void)? = nil) {
    switch response.result {
    case .success(let json):
        print("json: \(json)")
        if let responseData = response.data {
            _ = decode(responseData)
        }
    case .failure( _):
        if let failureClosure = failure { failureClosure() }
    }
}
