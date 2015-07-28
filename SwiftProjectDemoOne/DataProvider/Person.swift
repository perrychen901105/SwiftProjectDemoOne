//
//  Person.swift
//  SwiftProjectDemoOne
//
//  Created by PerryChen on 7/28/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import Foundation
import ObjectMapper

public class Person: Mappable {
    
    var firstName: String?
    var lastName: String?
    
    public static func newInstance() -> Mappable {
        return Person()
    }
    
    public func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
    }
    
}
