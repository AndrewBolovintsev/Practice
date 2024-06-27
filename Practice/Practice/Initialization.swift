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

