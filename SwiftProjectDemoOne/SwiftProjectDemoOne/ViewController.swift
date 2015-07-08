//
//  ViewController.swift
//  SwiftProjectDemoOne
//
//  Created by PerryChen on 7/8/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import UIKit

import Alamofire

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
        println(response)
        var datastring = NSString(data: data as! NSData, encoding: NSUTF8StringEncoding)
        println(datastring)
    }
    
    @IBAction func btnpressed_request(sender: AnyObject) {
        Alamofire.request(.GET, "http://127.0.0.1:8888/scriptOne.php").response(completionHandler)
    }

}

