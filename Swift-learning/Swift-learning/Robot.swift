//
//  Robot.swift
//  Swift-learning
//
//  Created by Admin on 20/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import Foundation

enum RobotErrors: Error {
    case lowBattery
    case nothingToBend
    case itIsBrokenFatally
    case notAThingToBend
}

class Robot {
    var queue = CustomQueue<Bendable>()
    var energy = Level.full
    
    func bendNext(it thing: Bendable, by angle: Int ) throws -> Bendable{
        var myThing = thing
        guard energy != Level.zero else {
            throw RobotErrors.lowBattery
        }
        guard thing.isItBendable else {
            throw RobotErrors.notAThingToBend
        }
        energy = energy.lowerLevel
        myThing.currentAngle += angle
        return myThing
    }
}
