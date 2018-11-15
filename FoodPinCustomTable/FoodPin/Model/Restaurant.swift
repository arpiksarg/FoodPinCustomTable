//
//  Restaurant.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/14/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    var phone: String
    var description: String
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool, phone: String, description: String) {
        self.name = name
        self.image = image
        self.type = type
        self.location = location
        self.isVisited = isVisited
        self.phone = phone
        self.description = description
    }
    
    convenience init() {
        self.init(name: "", type: "", location: "", image: "", isVisited: false, phone: "", description: "")
    }
}
