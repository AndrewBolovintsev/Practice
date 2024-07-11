//
//  Extensions.swift
//  Practice
//
//  Created by Андрей Боловинцев on 11.07.24.
//

import Foundation

func extensions() {
    let oneInch = 25.4.mm
    print("One inch is \(oneInch) meters")

    let threeFeet = 3.ft
    print("Three feet is \(threeFeet) meters")
    
    let aMarathon = 32.km + 194.m
    print("A marathon is \(aMarathon) meters long")
    
    
    
    let defaultRect = Rect7()
    let memberwiseRect = Rect7(origin: Point7(x: 2.0, y: 2.0), size: Size7(width: 5.0, height: 5.0))
    print(memberwiseRect.size)
    
    let centerRect = Rect7(center: Point7(x: 4.0, y: 4.0), size: Size7(width: 3.0, height: 3.0))
    print(centerRect.size)
    
    
    
    5.repetitions {
        print("Hello, World!")
    }
    
    
    
    var someInt = 3
    someInt.sum()
    
    
    
    print(30947569345[2])
    
    
    
    printIntegerMood([3, 19, -27, 0, -6, 0, 7])
}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}



struct Size7 {
    var width = 0.0, height = 0.0
}
struct Point7 {
    var x = 0.0, y = 0.0
}
struct Rect7 {
    var origin = Point7()
    var size = Size7()
}
extension Rect7 {
    init(center: Point7, size: Size7) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point7(x: originX, y: originY), size: size)
    }
}



extension Int {
    func repetitions(task: () -> Void) {
        for i in 0..<self {
            task()
        }
    }
}



extension Int {
    mutating func sum() {
        self = self + self
    }
}



extension Int {
    subscript(index: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<index {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}


extension Int {
    
    enum Mood {
        case kind, evil, tired, happy, noMood
    }
    
    var mood: Mood {
        switch self {
        case 0:
            return .tired
        case let x where x == 1:
            return .evil
        case let x where x == 2:
            return .kind
        case let x  where x > 2:
            return .happy
        default:
            return .noMood
        }
    }
}
func printIntegerMood(_ num: [Int]) {
    for i in num {
        switch i.mood {
        case .noMood:
            print("no mood", terminator: ", ")
        case .tired:
            print("tired", terminator: ", ")
        case .evil:
            print("evil", terminator: ", ")
        case .kind:
            print("kind", terminator: ", ")
        case .happy:
            print("happy", terminator: ", ")
        }
    }
    print()
}
