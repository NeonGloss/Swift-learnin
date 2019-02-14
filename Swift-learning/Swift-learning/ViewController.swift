//
//  ViewController.swift
//  Swift-learning
//
//  Created by Admin on 06/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import UIKit


enum Level: Int{
    case full
    case middle
    case low
    case zero
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

class ViewController: UIViewController {
  
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для автомобиля и грузовика.
// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
    class PassengerCar: Car{
        var description: String {
            return String("-------------------\n" + "brand: \(self.brand)\n" + "assembleYear: \(self.assembleYear)\n" + "storageCapacity: \(self.storageCapacity)\n" + "storageOccupation: \(self.storageOccupation)\n" + "isItWounded: \(self.isItWounded)\n" + "windowsAreOpened: \(self.windowsAreOpened)\n" + "isChildChareExist: \(self.isChildChareExist)\n")
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
    
 
    
// executable code ----------------------------------------------------------------------------
    
    var vehicle: Car = Lorry(brand: "Noname", assembleYear: 1, storageCapacity: 1, storageOccupation: 1, isItWounded: true, windowsAreOpened: true, isTrailerExist: true)

    
    @IBAction func initACar(_ sender: UIButton) {
        
        if Int.random(in: 0...1) == 1 {
            vehicle = Lorry(brand: "Toyota", assembleYear: Int.random(in: 1950...2018), storageCapacity: 1000, storageOccupation: Int.random(in: 0...1000), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), isTrailerExist: Bool.random())
            print("Теперь у нас есть грузовик")
            print(vehicle as! Lorry)
        } else {
            vehicle = PassengerCar(brand: "Nissan", assembleYear: Int.random(in: 1950...2018), storageCapacity: 100, storageOccupation: Int.random(in: 0...100), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), isChildChareExist: Bool.random())
            print("Теперь у нас есть легковой автомобиль")
            print(vehicle as! PassengerCar)
        }
    }

    
    @IBAction func performRandomActionWithVehicle(_ sender: UIButton) {
        switch Int.random(in: 1...4){
            case 1:
                    print("Изменим состояние Окон")
                    vehicle.windowsAreOpened = vehicle.performBool(action: .invertWindowsState)
            case 2:
                    print("Изменим состояние Двигателя")
                    vehicle.isItWounded = vehicle.performBool(action: .invertEngine)
            case 3:
                    print("погрузим или выгрузим чтонибудь")
                    vehicle.storageOccupation = vehicle.performLoadUnload(action: .loadingStorage(Int.random(in: -100...100)))
            case 4:
                print("выполним специфическое для класса действие")
                    if vehicle is Lorry {
                        (vehicle as! Lorry).isTrailerExist  = vehicle.performSpecific(action: .addRemoveTrailer)
                    } else {
                        (vehicle as! PassengerCar).isChildChareExist = vehicle.performSpecific(action: .putRemoveChildCair)
                    }
            default:
                break
        }
        if vehicle is Lorry {
            print(vehicle as! Lorry)
        } else {
            print(vehicle as! PassengerCar)
        }
    }
}
