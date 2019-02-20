//
//  ViewController.swift
//  Swift-learning
//
//  Created by Admin on 06/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
//For HW#7
    @IBAction func checkingHW7(_ sender: UIButton) {
        let robotBender = Robot()
        robotBender.energy = Level.full
        let angle = Int.random(in: -360...360)
        var experementalThing: Bendable
        
        experementalThing =  Int.random(in: 1...2) == 1 ? PassengerCar() : Human()
        do {
            print("будем сгибать: \(experementalThing)")
            experementalThing = try robotBender.bendNext(it: experementalThing, by: angle)
            print("После сгибания: \(experementalThing)")
        }catch RobotErrors.lowBattery {
            print("Не смогу согнуть! Энергия кончилась!! Заряжаю до упора!")
            robotBender.energy = Level.full
        }catch RobotErrors.notAThingToBend {
            print("Это нельзя сгибать!")
        }catch let otherError {
            print(otherError.localizedDescription)
        }
    }
    
    
    
    
    
    
    
    
//For HW#6
    @IBAction func checkingHW6(_ sender: UIButton) {
        var queue = CustomQueue<Int>()
        queue.push(newItem: 5)
        queue.push(newItem: 9)
        queue.push(newItem: 3)
        queue.push(newItem: 8)
        queue.push(newItem: 3)
        queue.push(newItem: 2)
        queue.push(newItem: 9)
        queue.push(newItem: 9)
        print(queue)
        
        let firstInQueue = queue.pull()
        print("Забрали один элемент: \(firstInQueue!)")
        print(queue)
        
        print("Все элементы меньше 5:  \(queue.filter(byClosure: {$0<5}))")
        queue.changeAllItems(byFormula: {$0 + 1})
        print("Прибавили ко всем элементам еденицу: \n\(queue)")
        print("Выведем элемент в очереди под номером индексом 3:\n\(queue[3]!)")
        print("Выведем элемент в очереди под номером индексом 15(По заданию дожно выдать NIL):\n\(String(describing: queue[15]))")
    }
    
//For HW#5
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
