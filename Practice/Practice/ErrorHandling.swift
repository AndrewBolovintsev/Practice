//
//  ErrorHandling.swift
//  Practice
//
//  Created by Андрей Боловинцев on 1.07.24.
//

import Foundation

func errorHandling() {
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels"
    ]
    
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
    let vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 10
    
    do {
        try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    } catch VendingMachineError.invalidSelection {
        print("Неправильный выбор.")
    } catch VendingMachineError.outOfStock {
        print("Товар закончился.")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("Недостаточно средств. Нужно ещё \(coinsNeeded) монет.")
    } catch {
        print("Неизвестная ошибка: \(error).")
    }
    
    if let result = try? vendingMachine.vend(itemNamed: "Pretzels") {
        print("Успешная покупка: \(result)")
    } else {
        print("Покупка не удалась.")
    }
    
    vendingMachine.coinsDeposited = 20
    let result = try! vendingMachine.vend(itemNamed: "Chips")
    print("Успешная покупка: \(result)")
    
    
    
    let ratings = [1, 2, 3, 2, 2, 1, 4]
    do {
        try summarize(ratings)
    } catch StatisticsError.noRatings {
        print("Нет оценок!")
    } catch StatisticsError.invalidRating(let rating) {
        print("Неверная оценка: \(rating)")
    } catch {
        print("Неизвестная ошибка: \(error)")
    }
    
    
    var name = "Alex", age = 23
    deferFunc(name: &name, age: &age)
}

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}



enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}

func summarize(_ ratings: [Int]) throws {
    
    guard !ratings.isEmpty else { throw StatisticsError.noRatings }
    
    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating > 0 && rating <= 3 else { throw StatisticsError.invalidRating(rating) }
        counts[rating]! += 1
    }
    
    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}



func deferFunc(name: inout String, age: inout Int) {
    defer {
        name = "Noname"
        age = 0
        print("Name = \(name) and age = \(age)")
    }
    return print("Name = \(name) and age = \(age)")
}
