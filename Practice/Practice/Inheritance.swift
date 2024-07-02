//
//  Inheritance.swift
//  Practice
//
//  Created by Андрей Боловинцев on 25.06.24.
//

import Foundation

func inheritance() {
    
    let someVehicle = Vehicle1()
    print("Vehicle: \(someVehicle.description)")
    
    let bicycle = Bicycle1()
    bicycle.hasBasket = true
    bicycle.currentSpeed = 15.0
    print("Bicycle: \(bicycle.description)")
    
    let tandem = Tandem()
    tandem.hasBasket = true
    tandem.currentNumberOfPassengers = 2
    tandem.currentSpeed = 22.0
    print("Tandem: \(tandem.description)")
    
    let train = Train()
    train.makeNoise()
    
    let car = Car1()
    car.currentSpeed = 25.0
    car.gear = 3
    print("Car: \(car.description)")
    
    
    let automatic = AutomaticCar()
    automatic.currentSpeed = 35.0
    print("AutomaticCar: \(automatic.description)")
}

class Vehicle1 {
    
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

class Bicycle1: Vehicle1 {
    final var hasBasket = false
}

final class Tandem: Bicycle1 {
    var currentNumberOfPassengers = 0
}

final class Train: Vehicle1 {
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car1: Vehicle1 {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

final class AutomaticCar: Car1 {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
