//
//  ProcessParameter.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/1/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation
import Alamofire
import MapKit

let processParameter = ProcessParameter.instance
class ProcessParameter: NSObject, CLLocationManagerDelegate {
    static var instance = ProcessParameter()
    
    private var myLocation : CLLocation!
    var authenTransactionId = ""
    
    func processReponse(response : DataResponse<Any>) -> Login_DTO {
        if(response.result.isSuccess) {
            return Login_DTO.init(dictionary: response.result.value as! NSDictionary)
        } else {
            let response = Login_DTO.init()
            return response
        }
    }
    
    func repareRequest(_ parameter : Dictionary <String,Any>) -> Parameters {
        var endParameter : Parameters = [:]
        
        for (k,v) in parameter {
            endParameter[k] = v
        }
        
        return endParameter
    }
}
