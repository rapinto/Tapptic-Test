//
//  Element+Networking.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import Alamofire

extension Element {
    
    // MARK: Requests
    
    static func sendGetElements (success: @escaping ([Element]) -> Void,
                                 failure: @escaping (Error) -> Void) {
        Alamofire.request("http://dev.tapptic.com/test/json.php").responseJSON { (response : DataResponse<Any>) in
            
            guard response.error == nil else {
                failure(response.error!)
                return
            }
            
            guard let value = response.result.value else {
                failure("nil result value" as! Error)
                return
            }
            
            guard let array = value as? Array<Dictionary<AnyHashable, Any>> else {
                failure("wrong json format" as! Error)
                return
            }
            
            let elements = Element.parse(array: array)
            success(elements)
        }
    }
    
    static func sendGetElement (element: Element,
                                success: @escaping () -> Void,
                                failure: @escaping (Error) -> Void) {
        let route = "http://dev.tapptic.com/test/json.php?name=" + element.name
        Alamofire.request(route).responseJSON { (response : DataResponse<Any>) in
            
            guard response.error == nil else {
                failure(response.error!)
                return
            }
            
            guard let value = response.result.value else {
                failure("nil result value" as! Error)
                return
            }
            
            guard let dictionary = value as? Dictionary<AnyHashable, Any> else {
                failure("wrong json format" as! Error)
                return
            }
            
            element.update(dictionary: dictionary)
            success()
        }
    }
}

