//
//  DataProviderService.swift
//  SwiftProjectDemoOne
//
//  Created by PerryChen on 7/28/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
typealias ClassListCompletionBlcok = (classes: [Person]?, error: NSError?) -> ()
class DataProviderService {
    class var sharedInstance: DataProviderService {
        struct Singleton {
            static let instance = DataProviderService()
        }
        return Singleton.instance
    }
    

    
    func getAllClassList(completion: ClassListCompletionBlcok) {
        Alamofire.request(.GET, "http://127.0.0.1:8888/scriptOne.php").response { (request: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, err: NSError?) -> Void in
            if err == nil {
                var json = JSON(data: data as! NSData, options: NSJSONReadingOptions.AllowFragments, error: nil)
                var employees = json["body"]["employees"]
                for i in 0...employees.count {
                    var p = Mapper<Person>().map(employees[i].string)
                    println(p?.lastName)
                }
//                completion(classes: <#[Person]?#>, error: <#NSError?#>)
                println(json["result"])
            }
            
        }
    }
}

