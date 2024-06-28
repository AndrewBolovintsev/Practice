//
//  Initialization.swift
//  Practice
//
//  Created by Андрей Боловинцев on 26.06.24.
//

import Foundation

func initialization() {
    
    var f = Fahrenheit()
    print("The default temperature is \(f.temperature)° Fahrenheit")
    
    
    
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    print(boilingPointOfWater)
    let freezingPointOfWater = Celsius(fromKelvin: 273.15)
    print(freezingPointOfWater)
    
    
    
    let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    let halfGray = Color(white: 0.5)
    print(halfGray.green)
    
    
    
    let bodyTemperature = Celsius1(37.0)
    print(bodyTemperature)
    
    
    
    let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
    cheeseQuestion.ask()
    cheeseQuestion.response = "Yes, I do like cheese."
    if let response = cheeseQuestion.response { print(response) }
    
    
    
    let beetsQuestion = SurveyQuestion(text: "How about beets?")
    beetsQuestion.ask()
    beetsQuestion.response = "I also like beets. (But not with cheese.)"
    if let response = beetsQuestion.response { print(response) }
    
    
    
    let twoByTwo = Size5(width: 2.0, height: 2.0)
    print(twoByTwo.width, twoByTwo.height)
    let zeroByTwo = Size(height: 2.0)
    print(zeroByTwo.width, zeroByTwo.height)
    let zeroByZero = Size()
    print(zeroByZero.width, zeroByZero.height)
    
    
    
    let basicRect = Rect6()
    print(basicRect)
    
    let originRect = Rect6(origin: Point6(x: 2.0, y: 2.0), size: Size6(width: 5.0, height: 5.0))
    print(originRect)
    
    let centerRect = Rect6(center: Point6(x: 4.0, y: 4.0), size: Size6(width: 3.0, height: 3.0))
    print(centerRect)
    
    
    
    let vehicle = Vehicle()
    print("Vehicle: \(vehicle.description)")
    
    let bicycle = Bicycle()
    print("Bicycle: \(bicycle.description)")
    
    let hoverboard = Hoverboard(color: "silver")
    print("Hoverboard: \(hoverboard.description)")
    
    let namedMeat = Food(name: "Bacon")
    print("Food(name: \"Bacon\"): name = \(namedMeat.name)")
    
    let mysteryMeat = Food()
    print("Food(): name = \(mysteryMeat.name)")
    
    let oneMysteryItem = RecipeIngredient()
    print(oneMysteryItem.name)
    let oneBacon = RecipeIngredient(name: "Bacon")
    print(oneBacon.name)
    let twoApple = RecipeIngredient(name: "Apple", quantity: 2)
    print("\(twoApple.name) : \(twoApple.quantity)")
    
    var list = [
        ShoppingListItem(),
        ShoppingListItem(name: "Bacon"),
        ShoppingListItem(name: "Apple", quantity: 2),
    ]
    list[0].name = "Orange juice"
    list[0].purchased = true
    for item in list {
        print(item.description)
    }
    
    
    
    let someCreature = Animal(species: "Giraffe")
    if let giraffe = someCreature {
        print("An animal was initialized with a species of \(giraffe.species)")
    }
    
    let anonymousCreature = Animal(species: "")
    if anonymousCreature == nil {
        print("The anonymous creature couldn't be initialized")
    }
    
    
    
    let fahrenheitUnit = TemperatureUnit(symbol: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }
    
    let unknownUnit = TemperatureUnit(symbol: "X")
    if unknownUnit == nil {
        print("This isn't a defined temperature unit, so initialization failed.")
    }
    
    
    
    let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
    if fahrenheitUnit1 != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }

    let unknownUnit1 = TemperatureUnit1(rawValue: "X")
    if unknownUnit1 == nil {
        print("This isn't a defined temperature unit, so initialization failed.")
    }
    
    
    
    if let twoSocks = CartItem(name: "sock", quantity: 2) {
        print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
    }
    
    if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
        print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
    } else {
        print("Unable to initialize zero shirts")
    }
    
    if let oneUnnamed = CartItem(name: "", quantity: 1) {
        print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
    } else {
        print("Unable to initialize one unnamed product")
    }
}



struct Fahrenheit {
    
    var temperature: Double
    var temperature1 = 32.0
    
    init() {
        temperature = 35.0
    }
}



struct Celsius {
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}



struct Color {
    
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}



struct Celsius1 {
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}



class SurveyQuestion {
    
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() { print(text) }
}



class SurveyQuestion1 {
    
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() { print(text) }
}



struct Size5 {
    var width = 0.0, height = 0.0
}



struct Size6 {
    var width = 0.0, height = 0.0
}
struct Point6 {
    var x = 0.0, y = 0.0
}
struct Rect6 {
    
    var origin = Point6()
    var size = Size6()
    
    init() {}
    
    init(origin: Point6, size: Size6) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point6, size: Size6) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point6(x: originX, y: originY), size: size)
    }
}



class Vehicle {
    
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
class Bicycle: Vehicle {
    
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard: Vehicle {
    
    var color: String
    
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}



class Food {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
class RecipeIngredient: Food {
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
class ShoppingListItem: RecipeIngredient {
    
    var purchased = false
    
    var description: String {
        var output = "\(quantity) - \(name)"
        output += purchased ? " ✔︎" : " x"
        return output
    }
}



struct Animal {
    
    let species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}



enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

enum TemperatureUnit1: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}



class Product {
    
    let name: String
    
    init?(name: String) {
        
        if name.isEmpty { return nil }
        
        self.name = name
    }
}
class CartItem: Product {
    
    let quantity: Int
    
    init?(name: String, quantity: Int) {
        
        if quantity < 1 { return nil }
        
        self.quantity = quantity
        super.init(name: name)
    }
}
