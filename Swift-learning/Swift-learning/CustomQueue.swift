//
//  CustomQueue.swift
//  Swift-learning
//
//  Created by Admin on 17/02/2019.
//  Copyright © 2019 Roman Kuzin. All rights reserved.
//

import Foundation

struct CustomQueue<T> {
    private var _item: [T] = []
    
    mutating func push(newItem item: T) {
        _item.append(item)
    }
    mutating func pull() -> T?{
        return _item.removeFirst()
    }
    func filter(byClosure action: (T)-> Bool) -> [T]{
        var newQueue:[T] = []
        for (index, item) in _item.enumerated() {
            if action(item) {
                newQueue.append(_item[index])
            }
        }
        return newQueue
    }
    mutating func changeAllItems(byFormula action: (T)->T){
        if _item.count != 0 {
            for index in 0..<_item.count {
                _item[index] = action(_item[index])
            }
        }
    }
    subscript(_ index: Int) -> T?{
        return index < _item.count && index >= 0 && _item.count != 0 ? _item[index] : nil
    }
    
}

