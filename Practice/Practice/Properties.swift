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
    
    print(SomeStructure.storedTypeProperty)
    print(SomeEnumeration.computedTypeProperty)
    print(SomeClass1.computedTypeProperty)
    
    
    
    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()
    
    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)

    print(AudioChannel.maxInputLevelForAllChannels)
    
    
    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel)

    print(AudioChannel.maxInputLevelForAllChannels)
    
    
    
    
    
    
    
    var rectangle = Rectangle()
    print(rectangle.height, rectangle.width)
    
    var unitRectangle = UnitRectangle()
    print(unitRectangle.height, unitRectangle.width)
    
    var narrowRectangle = NarrowRectangle()
    print(narrowRectangle.height, narrowRectangle.width)

    narrowRectangle.height = 100
    narrowRectangle.width = 100
    print(narrowRectangle.height, narrowRectangle.width)
    
    var mixedRectangle = MixedRectangle()
    print(mixedRectangle.height)

    mixedRectangle.height = 20
    print(mixedRectangle.height)

    
    
    var someStructure = SomeStructure1()
    someStructure.num = 55
    print(someStructure.$num)
    
    
    var recg = SizedRectangle()
    let wasAdjustedSmall = recg.resize(to: .small)

    print("Height: \(recg.height), Width: \(recg.width)")
    print("Was height adjusted? \(recg.$height)")
    print("Was width adjusted? \(recg.$width)")
    print("Result of resize to small: \(wasAdjustedSmall)")

    print()

    let wasAdjustedLarge = recg.resize(to: .large)
    print("Height: \(recg.height), Width: \(recg.width)")
    print("Was height adjusted? \(recg.$height)")
    print("Was width adjusted? \(recg.$width)")
    print("Result of resize to large: \(wasAdjustedLarge)")
}

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass1 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}




@propertyWrapper
struct SizeLimiter {
    
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int  {
        get {
            return number
        }
        set {
            number = min(newValue, maximum)
        }
    }
    
    init() {
        maximum = 20
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 20
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct Rectangle {
    @SizeLimiter var height: Int
    @SizeLimiter var width: Int
}

struct UnitRectangle {
    @SizeLimiter var height: Int = 1
    @SizeLimiter var width: Int = 1
}

struct NarrowRectangle {
    @SizeLimiter(wrappedValue: 7, maximum: 5) var height: Int
    @SizeLimiter(wrappedValue: 3, maximum: 4) var width: Int
}

struct MixedRectangle {
    @SizeLimiter var height: Int = 1
    @SizeLimiter(maximum: 9) var width: Int = 2
}


@propertyWrapper
struct SizeLimiter1 {
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 20 {
                number = 20
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure1 {
    @SizeLimiter1 var num: Int
}

enum Size1 {
    case small, large
}

struct SizedRectangle {
    @SizeLimiter1 var height: Int
    @SizeLimiter1 var width: Int


    mutating func resize(to size: Size1) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}
