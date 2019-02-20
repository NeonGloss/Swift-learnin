//
//  Cars.swift
//  Swift-learning
//
//  Created by Admin on 17/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import Foundation

enum Level: Int{
    case full
    case middle
    case low
    case zero
}
extension Level {
    var lowerLevel: Level{
        get {
        switch self{
        case .full:
            return Level.middle
        case .middle:
            return Level.low
        case .low:
            return Level.zero
        case .zero:
            return Level.zero
            }
        }
    }
}

enum ActionOverACar {
    case invertEngine
    case invertWindowsState
    case loadingStorage(Int)
    case addRemoveTrailer
    case putRemoveChildCair
}

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car : CustomStringConvertible{
    var brand: String { get set }
    var assembleYear: Int { get set }
    var storageCapacity: Int { get  set }
    var storageOccupation: Int { get  set }
    var isItWounded: Bool { get  set }
    var windowsAreOpened: Bool { get  set }
    
    func performSpecific(action: ActionOverACar) -> Bool
}

//2.Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем:
//  открыть/закрыть окно, запустить/заглушить двигатель и т.д.
//  (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    func performBool (action: ActionOverACar) -> Bool {
        switch action{
        case .invertEngine:
            return !isItWounded
        case .invertWindowsState:
            return !windowsAreOpened
        default:
            print("this action unallowable")
        }
        return true
    }
    
    func performLoadUnload (action: ActionOverACar) -> Int{
        switch action{
        case .loadingStorage(let load):
            if 0 <= (storageOccupation + load) && (storageOccupation + load) < storageCapacity {
                return storageOccupation + load
            } else if 0 < (storageOccupation + load){
                return 0
            } else {
                return storageCapacity
            }
        default:
            print("this action unallowable")
        }
        return 0
    }
    
}

// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для автомобиля и грузовика.
// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

class PassengerCar: Car, Bendable{
    let isItBendable = true
    var currentAngle = 0
    
    var bendedCritically: Bool {
            get {
                return (-360...360).contains(currentAngle) ? true : false                
            }
        }
    
    var description: String {
        return String("-------------------\n" + "brand: \(self.brand)\n" + "assembleYear: \(self.assembleYear)\n" + "storageCapacity: \(self.storageCapacity)\n" + "storageOccupation: \(self.storageOccupation)\n" + "isItWounded: \(self.isItWounded)\n" + "windowsAreOpened: \(self.windowsAreOpened)\n" + "isChildChareExist: \(self.isChildChareExist)\n" + "isItBendable: \(self.isItBendable)\n" + "currentAngle: \(self.currentAngle)\n")
    }
    
    func performSpecific(action: ActionOverACar) -> Bool{
        switch action{
        case .putRemoveChildCair:
            return !self.isChildChareExist
        default: return !self.isChildChareExist
        }
    }
    
    var brand: String
    var assembleYear: Int
    var storageCapacity: Int
    var storageOccupation: Int
    var isItWounded: Bool
    var windowsAreOpened: Bool
    var  isChildChareExist = false
    
    init(brand: String,
         assembleYear: Int,
         storageCapacity: Int,
         storageOccupation: Int,
         isItWounded:Bool,
         windowsAreOpened: Bool,
         isChildChareExist: Bool){
        
        self.brand = brand
        self.assembleYear = assembleYear
        self.storageCapacity = storageCapacity
        self.isItWounded = isItWounded
        self.storageOccupation = storageOccupation
        self.windowsAreOpened = windowsAreOpened
        self.isChildChareExist = isChildChareExist
    }
    
    convenience init() {
        self.init(brand: "Volvo", assembleYear: 2010, storageCapacity: 100, storageOccupation: 50, isItWounded: false, windowsAreOpened: false, isChildChareExist: true)
    }
}

class Lorry: Car {
    var description: String {
        return String("-------------------\n" + "brand: \(self.brand)\n" + "assembleYear: \(self.assembleYear)\n" + "storageCapacity: \(self.storageCapacity)\n" + "storageOccupation: \(self.storageOccupation)\n" + "isItWounded: \(self.isItWounded)\n" + "windowsAreOpened: \(self.windowsAreOpened)\n" + "isTrailerExist: \(self.isTrailerExist)\n")
    }
    
    func performSpecific(action: ActionOverACar) -> Bool{
        switch action{
        case .addRemoveTrailer:
            return !self.isTrailerExist
        default: return self.isTrailerExist
        }
    }
    
    
    var brand: String
    var assembleYear: Int
    var storageCapacity: Int
    var storageOccupation: Int
    var isItWounded: Bool
    var windowsAreOpened: Bool
    var isTrailerExist = false
    
    func performAdoptTrailer(action: ActionOverACar) {
        
    }
    
    init(brand: String,
         assembleYear: Int,
         storageCapacity: Int,
         storageOccupation: Int,
         isItWounded:Bool,
         windowsAreOpened: Bool,
         isTrailerExist: Bool){
        self.brand = brand
        self.assembleYear = assembleYear
        self.storageCapacity = storageCapacity
        self.storageOccupation = storageOccupation
        self.isItWounded = isItWounded
        self.windowsAreOpened = windowsAreOpened
        self.isTrailerExist = isTrailerExist
    }
}

