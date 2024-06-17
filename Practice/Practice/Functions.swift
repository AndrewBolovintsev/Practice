//
//  Functions.swift
//  Practice
//
//  Created by Андрей Боловинцев on 14.06.24.
//

import Foundation

func functions() {
    
    print(greet(person: "Alex"))
    print(sayHelloWorld())
    print(greet1(person: "Alex", age: 34, active: true))
    greet2(person: "Dave")
    printWithoutCounting(string: "hello, world")
    
    if let valArr = minMax(arr: [3, 5, 6, 8, 24, 5, 65, 3, 1, 56]) {
        print("In an array with the number of elements \(valArr.count), the minimum rank is \(valArr.min), the maximum is \(valArr.max)")
    }
    else {
        print("Array is empty")
    }
    
    print(greeting(for: "Dave"))
    
    print(greet3(person: "Bill", from: "Cupertino"))
    
    print(arithmeticMean(numbers: 1, 2, 3, 4, 5))
    
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("SomeInt is now \(someInt), and anotherInt is now \(anotherInt)")
    
    var mathFunction: (Int, Int) -> Int = addTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    mathFunction = multiplyTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    let anotherMathFunction = addTwoInts
    
    printMathResult(addTwoInts, 3, 5)
    
    
    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    
    while currentValue != 0 {
        print("\(currentValue)", terminator: "; ")
        currentValue = moveNearerToZero(currentValue)
    }
    
    print()
    
    var currentValue1 = -4
    let moveNearerToZero1 = chooseStepFunction1(backward: currentValue1 > 0)
    
    while currentValue1 != 0 {
        print("\(currentValue1)", terminator: "; ")
        currentValue1 = moveNearerToZero1(currentValue1)
    }
}

func greet(person: String) -> String {
    return "Hello, \(person)"
}

func sayHelloWorld() -> String {
    return "Hello, world!"
}

func greet1(person: String, age: Int, active: Bool) -> String {
    if age > 18 && active {
        return "Hello, \(person). You are already very active in your adult years"
    }
    else if age < 18 && active {
        return "Hello, \(person). You are already very active in your younger years"
    }
    else {
        return "Hello, \(person). At the age of \(age), you show little activity"
    }
}

func greet2(person: String) {
    print("Hello, \(person)!")
}

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

func minMax(arr: [Int]) -> (count: Int, min: Int, max: Int)? {
    
    guard !arr.isEmpty else  { return nil }
    
    var currentMin = arr[0], currentMax = arr[0], count = 0
    
    for i in arr[1..<arr.count] {
        if i < currentMin {
            currentMin = i
        }
        else if i > currentMax {
            currentMax = i
        }
        count += 1
    }
    
    return (count, currentMin, currentMax)
}

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}

func greet3(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}


func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}


func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    
    func stepForward1(input: Int) -> Int {
        return input + 1
    }
    func stepBackward1(input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward1 : stepForward1
}
