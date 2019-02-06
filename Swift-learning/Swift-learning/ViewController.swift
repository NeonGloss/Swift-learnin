//
//  ViewController.swift
//  Swift-learning
//
//  Created by Admin on 06/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    enum Level: Int{
        case full
        case middle
        case low
        case zero
    }
    
    //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    enum ActionOverACar {
        case invertEngine
        case invertWindowsState
        case loadingStorage(Int)
    }
    
    //1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
    //2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    struct PassengerCar {
        var brand: String
        var assembleYear: Int
        var storageCapacity = 100
        var storageOccupation = 0
        var isItWounded = false
        var windowsAreOpened = false
        var tankFullness = Level.zero
        
        //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
        mutating func perform(action: ActionOverACar){
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
            }
        }
    }
    
    struct Lorry {
        var brand: String
        var assembleYear: Int
        var storageCapacity = 1000
        var storageOccupation = 0
        var isItWounded = false
        var windowsAreOpened = false
        var tankFullness = Level.zero
        
        mutating func perform(action: ActionOverACar){
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
            }
        }
        
        
    }
    
    var vehicle: Any?
    
    @IBAction func initACar(_ sender: UIButton) {
        
        if Int.random(in: 0...1) == 1 {
            vehicle = Lorry(brand: "Toyota", assembleYear: Int.random(in: 1950...2018), storageCapacity: 1000, storageOccupation: Int.random(in: 0...1000), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), tankFullness: Level.full)
            print("Теперь у нас есть грузовик")
            print(vehicle!)
            print("--------------------------------------------------------")
        } else {
            vehicle = PassengerCar(brand: "Nissan", assembleYear: Int.random(in: 1950...2018), storageCapacity: 100, storageOccupation: Int.random(in: 0...100), isItWounded: Bool.random(), windowsAreOpened: Bool.random(), tankFullness: Level.full)
            print("Теперь у нас есть легковой автомобиль")
            print(vehicle!)
            print("--------------------------------------------------------")
        }
    }
    //5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
    //6. Вывести значения свойств экземпляров в консоль
    
    @IBAction func performRandomActionWithVehicle(_ sender: UIButton) {
        if var currentVehicle = vehicle as? Lorry {
            switch Int.random(in: 1...3){
                case 1:
                    print("Изменим состояние Окон")
                    currentVehicle.perform(action: .invertWindowsState)
                case 2:
                    print("Изменим состояние Двигателя")
                    currentVehicle.perform(action: .invertEngine)
                case 3:
                    print("погрузим или выгрузим чтонибудь")
                    currentVehicle.perform(action: .loadingStorage(Int.random(in: -1000...1000)))
                default:
                    break
            }
            vehicle = currentVehicle
            print(vehicle!)
            print("--------------------------------------------------------")
        } else if var currentVehicle = vehicle as? PassengerCar{
            switch Int.random(in: 1...3){
            case 1:
                print("Изменим состояние Окон")
                currentVehicle.perform(action: .invertWindowsState)
            case 2:
                print("Изменим состояние Двигателя")
                currentVehicle.perform(action: .invertEngine)
            case 3:
                print("погрузим или выгрузим чтонибудь")
                currentVehicle.perform(action: .loadingStorage(Int.random(in: -100...100)))
            default:
                break
            }
            vehicle = currentVehicle
            print(vehicle!)
            print("--------------------------------------------------------")
            
        }
    }
}

