//
//  Control Flow.swift
//  Practice
//
//  Created by Андрей Боловинцев on 14.06.24.
//

import Foundation

func controlFlow() {
    
    //For-in Loops
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
    
    let countCar = ["Mersedes": 8, "BMW": 6, "Audi": 4]
    for (name, count) in countCar {
        print("\(name)s have \(count)")
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
    
    let minutes = 60
    for tickMark in 0..<minutes {
        print("\(tickMark)", terminator: " ")
    }
    
    for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
        let degrees = Int(radians * 180 / .pi)
        print("Degrees: \(degrees), radians: \(radians)")
    }
    
    for countdown in stride(from: 3, to: 0, by: -1) {
        print("\(countdown)", terminator: " ")
    }
    
    print()
    
    //Sequence
    let collect = ControlFlow()
    for i in collect {
        print("\(i)", terminator: " ")
    }
    
    //While Loops
    
}

class ControlFlow: Sequence, IteratorProtocol {
    
    var currentIndex = 0
    let elements = [1, 2, 3, 4, 5]
    
    // Функция для перехода к следующему элементу
    func next() -> Int? {
        guard currentIndex < elements.count else { return nil }
        defer { currentIndex += 1 }
        return elements[currentIndex]
    }
    
    // Реализуем метод makeIterator(), который возвращает экземпляр итератора
    func makeIterator() -> Iterator {
        return Iterator()
    }
}
