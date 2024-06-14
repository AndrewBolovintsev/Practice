//
//  Control Flow.swift
//  Practice
//
//  Created by Андрей Боловинцев on 13.06.24.
//

import Foundation

func controlFlow() {
    
    //For-In Loops
    let shopList = ["Orange", "Banana", "Milk", "Cheese", "Bread", "Meat"]
    for i in shopList {
        print(i)
    }
    
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (key, value) in numberOfLegs {
        print("\(key)s have \(value) legs")
    }
    
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base
    }
    print("\(base) to the power of \(power) is \(answer)")
    
    for i in stride(from: 0, to: 60, by: 5) {
       print(i)
    }
    
    //While Loops
    
}
