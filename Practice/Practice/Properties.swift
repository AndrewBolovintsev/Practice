//
//  Properties.swift
//  Practice
//
//  Created by Андрей Боловинцев on 20.06.24.
//

import Foundation

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class Toy {
    var name: String
    lazy var description: String = {
        return "This is a toy named \(self.name)"
    }()

    init(name: String) {
        self.name = name
    }
}

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

func properties() {
    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
    rangeOfThreeItems.firstValue = 6
    
    let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
    
    let myToy = Toy(name: "Robot")
    print(myToy.description)
    
    var square = Rect(origin: Point(x: 0.0, y: 0.0),
        size: Size(width: 10.0, height: 10.0))
    print(square.center)

    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
    
    let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
    print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
    
    
    let stepCounter = StepCounter()
    stepCounter.totalSteps = 200
    stepCounter.totalSteps = 360
}
