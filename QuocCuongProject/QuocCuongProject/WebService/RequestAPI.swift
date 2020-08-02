//
//  RequestAPI.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/1/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation
import Alamofire

let servicesRequestAPI = ServicesRequestAPI.shared
class ServicesRequestAPI: NSObject {
    static var shared =  ServicesRequestAPI()
    
    
    func requestAPI(requestParameters: MI, success :@escaping ((Login_DTO)->Void)) {
        
        let tempHeaders: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json;charset=utf-8",
            "Accept-Encoding": "gzip"
        ]
        
        let requestAPI = "http://yelp-test.kennjdemo.com/api/v1/user/login"
        let parameters = processParameter.repareRequest(requestParameters.dictionary() as Dictionary<String, AnyObject>)
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            if let json = json {
                print("===\nAPI: \(requestAPI) \nJSON : \(json)\n=== end === \n\n")
            }
            
        } catch {
            print("===\nLỗi API \(requestAPI) :\(error)\n===")
        }
        
        
         Alamofire.request(requestAPI, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: tempHeaders).responseJSON(completionHandler: {(response) in
            
           let apiResponse = processParameter.processReponse(response: response)
            
            switch (response.result) {
            case .success (_):
                success(apiResponse)
                break
            case .failure(let error):
                print("\n\nAuth request failed with error:\n \(error)")
                break
            }
            
        })
        
        
        
    }
        
}

extension ServicesRequestAPI {
    class func login (request : Login_Request, success : @escaping ((LoginData, Bool)->Void)) {
        servicesRequestAPI.requestAPI(requestParameters: request, success: { (response) in
            
            let dto = LoginData.init(dictionary: response.data as! NSDictionary)
            success(dto, response.result)
            
        })
    }
}
