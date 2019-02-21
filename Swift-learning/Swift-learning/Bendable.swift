//
//  Bendable.swift
//  Swift-learning
//
//  Created by Admin on 20/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import Foundation

protocol Bendable {
    var isItBendable: Bool { get }
    var currentAngle: Int{ get set }
    var bendedCritically: Bool { get }
}
