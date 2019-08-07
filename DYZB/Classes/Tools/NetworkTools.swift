//
//  NetworkTools.swift
//  DYZB
//
//  Created by ios on 07/08/2019.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools: NSObject {

    class func requestData(type: MethodType, url: String, parameters: [String : Any]? = nil, finishCallback: @escaping (_ result: Any) -> ()) {
        
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { (responseJson) in
            
            guard let result = responseJson.result.value else {
                return
            }
            
            finishCallback(result)
        }
    }
}
