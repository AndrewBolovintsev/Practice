//
//  Methods.swift
//  Practice
//
//  Created by Андрей Боловинцев on 24.06.24.
//

import Foundation

func methods() {
    
    let counter = Counter()
    counter.increment()
    print(counter.count)
    counter.increment(by: 5)
    print(counter.count)
    counter.reset()
    print(counter.count)
    
    
    
    let somePoint = Point1(x: 4.0, y: 5.0)
    if somePoint.isToTheRightOf(x: 1.0) { print("This point is to the right of the line where x == 1.0") }
    
    
    
    var somePoint2 = Point2(x: 1.0, y: 1.0)
    somePoint2.moveBy(x: 2.0, y: 3.0)
    print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
    
    var somePoint3 = Point3(x: 3.0, y: 2.0)
    somePoint3.moveBy(x: 2.0, y: 4.0)
    print("The point is now at (\(somePoint3.x), \(somePoint3.y))")
    
    var ovenLight = TriStateSwitch.low
    ovenLight.next()
    ovenLight.next()
    
    
    
    SomeClass3.someTypeMethod()
    
    
    var player = Player(name: "Argyrios")
    player.complete(level: 1)
    print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
    
    player = Player(name: "Beto")
    if player.tracker.advance(to: 6) {
        print("player is now on level 6")
    } else {
        print("level 6 hasn't yet been unlocked")
    }
}

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}


struct Point1 {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}


struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}


struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}


enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
            print("Next state: \(self)")
        case .low:
            self = .high
            print("Next state: \(self)")
        case .high:
            self = .off
            print("Next state: \(self)")
        }
    }
}


class SomeClass3 {
    class func someTypeMethod() {
        print("SomeClass3")
    }
}


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1


    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }


    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }


    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
