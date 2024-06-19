//
//  Enumerations.swift
//  Practice
//
//  Created by Андрей Боловинцев on 19.06.24.
//

import Foundation

enum SeasonYars {
    case summer
    case autumn
    case winter
    case spring
}

enum Car: CaseIterable {
    case bmw, mersedes, audi, nissan
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

enum Emoji: Character {
    case cat = "🐱"
    case dog = "🐶"
    case monkey = "🙈"
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum CompassPoint: String {
    case north, south, east, west
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func enumerations() {
    var season = SeasonYars.spring

    season = .winter

    switch season {
    case .autumn:
        print("Autumn")
    case .spring:
        print("Spring")
    case .summer:
        print("Summer")
    case .winter:
        print("Winter")
    }


    let model = Car.allCases.count
    print("There are \(model) models")

    for i in Car.allCases {
        print(i)
    }
    
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)
    productBarcode = .qrCode("enserivhmcw")

    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }

    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
    
    let emoji = Emoji.monkey

    switch emoji {
    case .cat:
        print(Emoji.cat.rawValue)
    case .dog:
        print(Emoji.dog.rawValue)
    case .monkey:
        print(Emoji.monkey.rawValue)
    }
    
    
    print(Planet.mars.rawValue)
    print(CompassPoint.north.rawValue)

    let positionToFind = 11
    if let somePlanet = Planet(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
    
    
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
    
    print(evaluate(product))
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
