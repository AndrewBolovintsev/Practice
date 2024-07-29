//
//  Generics.swift
//  Practice
//
//  Created by Андрей Боловинцев on 26.07.24.
//

import Foundation

func generics() {
    var someInt = 3
    var anotherInt = 107
    swapTwoValues(&someInt, &anotherInt)
    print("\(someInt) - \(anotherInt)")
    
    var someString = "hello"
    var anotherString = "world"
    swapTwoValues(&someString, &anotherString)
    print("\(someString) - \(anotherString)")
    
    
    var stackOfStrings = Stack<String>()
    stackOfStrings.push("uno")
    stackOfStrings.push("dos")
    stackOfStrings.push("tres")
    stackOfStrings.push("cuatro")
    print(stackOfStrings.items)
    stackOfStrings.pop()
    print(stackOfStrings.items)
    
    if let topItem = stackOfStrings.topItem {
        print("The top item on the stack is \(topItem).")
    }
    
    let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
    print(doubleIndex)
    let stringIndex = findIndex(of: "Andrei", in: ["Mike", "Malcolm", "Andrei"])
    print(stringIndex)
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}



struct Stack1<Element>: Container {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
