//
//  ViewController.swift
//  Swift-learning
//
//  Created by Admin on 06/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Level: Int{
        case full
        case middle
        case low
        case zero
    }
    
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
    enum ActionOverACar {
        case invertEngine
        case invertWindowsState
        case loadingStorage(Int)
        case addRemoveTrailer       //new for Truck
        case putRemoveChildCair     //new for PassangerCar
    }
  
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
    class CommonVehicle {
        var brand: String
        var assembleYear: Int
        var storageCapacity: Int
        var storageOccupation = 0
        var isItWounded = false
        var windowsAreOpened = false
        var tankFullness = Level.zero
        
        init(){
            brand = "Toyota"
            assembleYear = 1950
            storageCapacity = 100
        }
        init(brand: String, assembleYear: Int, storageCapacity: Int, storageOccupation: Int, isItWounded:Bool, windowsAreOpened: Bool, tankFullness: Level){
            self.brand = brand
            self.assembleYear = assembleYear
            self.storageCapacity = storageCapacity
            self.isItWounded = isItWounded
            self.windowsAreOpened = windowsAreOpened
            self.tankFullness = tankFullness
        }
        
        func perform(action: ActionOverACar){
        }

        func vehicleDescription()-> String {
            return  "--------------------------------------------------------\n" + "brand: \(self.brand)\n" + "assembleYear: \(self.assembleYear)\n" + "storageCapacity: \(self.storageCapacity)\n" + "storageOccupation: \(self.storageOccupation)\n" + "isItWounded: \(self.isItWounded)\n" + "windowsAreOpened: \(self.windowsAreOpened)\n"
        }
        
        
    }
    
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

    class PassengerCar: CommonVehicle {
        var  isChildChareExist = false
        
        init(brand: String, assembleYear: Int,
             storageCapacity: Int,
             storageOccupation: Int,
             isItWounded:Bool,
             windowsAreOpened: Bool,
             tankFullness: Level,
             isChildChareExist: Bool){
            super.init(brand: brand,
                   assembleYear: assembleYear,
                   storageCapacity: storageCapacity,
                   storageOccupation: storageOccupation,
                   isItWounded: isItWounded,
                   windowsAreOpened: windowsAreOpened,
                   tankFullness: tankFullness)
            self.isChildChareExist = isChildChareExist
            
        }
        
        override func perform(action: ActionOverACar){
            switch action{
            case .invertEngine:
                isItWounded = !isItWounded
            case .invertWindowsState:
                windowsAreOpened = !windowsAreOpened
            case .loadingStorage(let load):
                if 0 <= (storageOccupation + load) && (storageOccupation + load) < storageCapacity {
                    storageOccupation = storageOccupation + load
                } else if 0 < (storageOccupation + load){
                    storageOccupation = 0
                } else {
                    storageOccupation = storageCapacity
                }
            case .putRemoveChildCair:
                self.isChildChareExist = !self.isChildChareExist
            default: break
            }
        }
        override func vehicleDescription()-> String {
            return  super.vehicleDescription() + "isChildChareExist: \(self.isChildChareExist)\n"
        }
    }
    
    class Lorry: CommonVehicle {
        var isTrailerExist = false
        
        init(brand: String,
             assembleYear: Int,
             storageCapacity: Int,
             storageOccupation: Int,
             isItWounded:Bool,
             windowsAreOpened: Bool,
             tankFullness: Level,
             isTrailerExist: Bool){
            super.init(brand: brand,
                       assembleYear: assembleYear,
                       storageCapacity: storageCapacity,
                       storageOccupation: storageOccupation,
                       isItWounded: isItWounded,
                       windowsAreOpened: windowsAreOpened,
                       tankFullness: tankFullness)
            self.isTrailerExist = isTrailerExist
            
        }
        override func perform(action: ActionOverACar){
            switch action{
            case .invertEngine:
                isItWounded = !isItWounded
            case .invertWindowsState:
                windowsAreOpened = !windowsAreOpened
            case .loadingStorage(let load):
                if 0 <= (storageOccupation + load) && (storageOccupation + load) < storageCapacity {
                    storageOccupation = storageOccupation + load
                } else if 0 < (storageOccupation + load){
                    storageOccupation = 0
                } else {
                    storageOccupation = storageCapacity
                }
            case .addRemoveTrailer:
                isTrailerExist = !isTrailerExist
            default: break
            }
            
        }
        override func vehicleDescription()-> String {
            return  super.vehicleDescription() + "isTrailerExist: \(self.isTrailerExist)\n"
        
        }
    }
    
// executable code ----------------------------------------------------------------------------
    
    var vehicle: Any?
    
    @IBAction func initACar(_ sender: UIButton) {
        
        if Int.random(in: 0...1) == 1 {
            vehicle = Lorry(brand: "Toyota", assembleYear: Int.random(in: 1950...2018), storageCapacity: 1000, storageOccupation: Int.random(in: 0...1000), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), tankFullness: Level.full, isTrailerExist: Bool.random())
            print("Теперь у нас есть грузовик")
            print((vehicle as! Lorry).vehicleDescription())
        } else {
            vehicle = PassengerCar(brand: "Nissan", assembleYear: Int.random(in: 1950...2018), storageCapacity: 100, storageOccupation: Int.random(in: 0...100), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), tankFullness: Level.full, isChildChareExist: Bool.random())
            print("Теперь у нас есть легковой автомобиль")
            print((vehicle as! PassengerCar).vehicleDescription())
        }
    }
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.
    
    @IBAction func performRandomActionWithVehicle(_ sender: UIButton) {
        switch Int.random(in: 1...4){
            case 1:
                    print("Изменим состояние Окон")
                    (vehicle as! CommonVehicle).perform(action: .invertWindowsState)
            case 2:
                    print("Изменим состояние Двигателя")
                    (vehicle as! CommonVehicle).perform(action: .invertEngine)
            case 3:
                    print("погрузим или выгрузим чтонибудь")
                    (vehicle as! CommonVehicle).perform(action: .loadingStorage(Int.random(in: -1000...1000)))
            case 4:
                print("выполним специфическое для класса действие")
                    if vehicle is Lorry {
                        (vehicle as! Lorry).perform(action: .addRemoveTrailer)
                    } else {
                        (vehicle as! PassengerCar).perform(action: .putRemoveChildCair)
                    }
            default:
                break
        }
        if vehicle is Lorry {
            print((vehicle as! Lorry).vehicleDescription())
        } else {
            print((vehicle as! PassengerCar).vehicleDescription())
        }
    }
}
