//
//  Human.swift
//  Swift-learning
//
//  Created by Admin on 20/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import Foundation


class Human: Bendable, CustomStringConvertible{
    var description: String {
        return ("-----ЧЕЛОВЕК-----\n" + "isItBendable: \(self.isItBendable)\n" + "currentAngle: \(self.currentAngle)\n")
    }
    
    var isItBendable = false
    
    var currentAngle = 0
    
    var bendedCritically: Bool {
        get {
            return (-360 ... -50).contains(currentAngle) ? true : false || (150...360).contains(currentAngle) ? true : false
        }
    }
    
    var age = Int.random(in: 1930...2019)
    
}

