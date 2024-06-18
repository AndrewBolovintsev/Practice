//
//  Closures.swift
//  Practice
//
//  Created by Андрей Боловинцев on 17.06.24.
//

import Foundation

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

func closures() {
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 < s2
    }
    
    var reversedNames = names.sorted(by: backward)
    print(reversedNames)
    
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    print(reversedNames)
    
    reversedNames = names.sorted(by: { s1, s2 in return s1 < s2 })
    print(reversedNames)
    
    reversedNames = names.sorted(by: { $0 > $1 })
    print(reversedNames)
    
    reversedNames = names.sorted(by: <)
    print(reversedNames)
    
    //Trailing Closures
    let numbers1 = [1, 2, 3, 4, 5]
    let doubledNumbers = numbers1.map { (number: Int) -> Int in
        return number * 2
    }
    print(doubledNumbers)
    
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    
    let strings = numbers.map { (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    
    print(strings)
    
    let incrementByTen = makeIncrementer(forIncrement: 10)
    print(incrementByTen())
    print(incrementByTen())
    print(incrementByTen())
    
    let alsoIncrementByTen = incrementByTen
    print(alsoIncrementByTen())
    
    print(incrementByTen())
    print(alsoIncrementByTen())
    
    print("SomeClass")
    let instance = SomeClass()
    instance.doSomething()
    print(instance.x)

    completionHandlers.first?()
    print(instance.x)
    
    
    
    
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    
    let customerProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)
    print("Now serving \(customerProvider())!")
    print(customersInLine.count)
    
    
    
    
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))

    print("Collected \(customerProviders.count) closures.")
    
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider())!")
    }
    
    
    
    
    let person = Person(name: "Alex", surname: "Vegner", age: 23, isAuth: true)
    
    checkPersonAuth(person: person) { messSuccess in
        print(messSuccess)
    } onFailure: {
         print("Try again later")
    }
}


var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


struct Person {
    let name: String
    let surname: String
    let age: Int
    let isAuth: Bool
}

func checkPersonAuth(person: Person, onSuccess: (String) -> Void, onFailure: () -> Void) {
    if person.isAuth {
        onSuccess("\(person.name), you are logged in")
    } else {
        onFailure()
    }
}
