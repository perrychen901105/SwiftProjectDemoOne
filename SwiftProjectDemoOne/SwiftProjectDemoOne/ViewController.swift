//
//  ViewController.swift
//  SwiftProjectDemoOne
//
//  Created by PerryChen on 7/8/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper
//import SwiftyJSON
import DataProvider
class ViewController: UIViewController {

    @IBOutlet weak var btnRequest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func completionHandler(request: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, err: NSError?) -> Void {
//        var datastring = NSString(data: data as! NSData, encoding: NSUTF8StringEncoding)
        var json = JSON(data: data as! NSData, options: NSJSONReadingOptions.AllowFragments, error: nil)
        var employees = json["body"]["employees"]
        for i in 0...employees.count {
            var p = Mapper<Person>().map(employees[i].string)
            println(p?.lastName)
        }
        println(json["result"])
    }
    
    @IBAction func btnpressed_request(sender: AnyObject) {
        Alamofire.request(.GET, "http://127.0.0.1:8888/scriptOne.php").response(completionHandler)


//        Alamofire.request(.GET, "http://127.0.0.1:8888/scriptOne.php").responseJSON{ (req, res, json, err) -> Void in
//            if err != nil {
//                println("error")
//            } else {
//                var json = JSON(json!)
//                println("the json is \(json)")
//            }
//        }
    }

}

