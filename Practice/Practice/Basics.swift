//
//  Basics.swift
//  Practice
//
//  Created by Андрей Боловинцев on 10.06.24.
//

import Foundation

func basics() {
    
    // Constants and Variables
    let maxValue = 15
    var counter = 0
    
    counter += 1
    
    print("Maximum value constant \(maxValue) and the counter is equal \(counter)")
    
    var user = "admin"
    let points: Int
    
    if user == "admin" && counter == 0 {
        points = 0
    }
    else if counter >= 12 {
        points = 20
    }
    else {
        points = 10
    }
    
    //Type Annotations
    var message = "Hello World"
    var orange, red, pink: String
    
    message = "Hi, world"
    
    /*
     Variable changes value
     Constant does not change value
     Multiline Comment Notation
     Integers are whole numbers without a fractional part, such as 42 and -23.
     */
    
    //Integer Boundsin
    let minValue1 = UInt8.min  // minValue is equal to 0, and is of type UInt8
    let maxValue1 = UInt8.max  // maxValue is equal to 255, and is of type UInt8
    
    //Integer and Floating-Point Conversionin
    let three = 3
    let pointOneFourOneFiveNine = 0.141_5926
    let pi = Double(three) + pointOneFourOneFiveNine
    print(pi)
    
    //Type Aliasesin
    typealias AudioSample = UInt8
    var maxAmplitudeFound = AudioSample.max
    
    //Boolean
    let isAuth = true
    if isAuth {
        print("Welcome")
    }
    else {
        print("This account does not exist")
    }
    
    
    //Tuplesin
    var tuple1 = (34, point: "Points", true)
    if tuple1.2 {
        print("\(tuple1.0) \(tuple1.point) - confirmed")
        tuple1.0 = 50
    }
    else {
        let (q, _, _) = tuple1
        print("\(q) \(tuple1.point) - not confirmed")
    }
    
    //Optional and nil
    let possibleNumber = "123"
    let convertedNumber = Int(possibleNumber) ?? nil
    print(convertedNumber)
    
    var converted: Int?
    if converted != nil {
        print("Works")
    }
    else {
        print("Not worrking")
    }
    
    if let possibleNumber = Int(possibleNumber) {
        print("The string \"\(possibleNumber)\" has an integer value of \(possibleNumber)")
    } else {
        print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
    }
    
    let myNumber = Int(possibleNumber)
    if let myNumber {
        print("The string \(myNumber)")
    }
    
    
    if let firstNum = Int("32"), let secondNum = Int("65"), firstNum < secondNum && secondNum > 3 {
        print("\(firstNum) < \(secondNum) > 3")
    }
    
    guard let myNumber else {
        print("Noname")
        return
    }
    
    var num1 = "234"
    let num2 = Int(num1)
    let num3 = num2!
    guard let num3 = num2 else {
        fatalError("The number was invalid")
    }

    //Implicitly Unwrapped Optionalsin
    let str: String? = "Optional string one"
    let srtFinal: String = str! // Requires explicit unwrapping

    let str1: String! = "Optional string two"
    let strImplicit: String = str1 // Unwrapped automatically
    
    
    //Error Handlingin page link
    do {
        let confirmation = try rentCar(paymentMethod: "CreditCard")
        print(confirmation)
    } catch RentalError.noAvailableCars {
        print("No available cars")
    } catch RentalError.paymentFailed {
        print("Payment failed")
    } catch {
        print("An unknown error occurred: \(error)")
    }
    
    
    let temperature = 36.6
    if temperature > 36.0 && temperature < 37.0 {
        print("Are you healthy")
    }
    else if temperature >= 37.0 && temperature <= 38.5 {
        assertionFailure("Is there something wrong with you")
    }
    //assert(temperature > 41.0, "Call an ambulance")
    
    let index = 2
    precondition(index > 0, "Index must be greater than zero.")
}

enum RentalError: Error {
    case noAvailableCars
    case paymentFailed
}

func rentCar(paymentMethod: String) throws -> String {
    let availableCars = 1
    let methodPayment = "CreditCard"
    
    guard availableCars > 0 else {
        throw RentalError.noAvailableCars
    }
    
    guard methodPayment == paymentMethod else {
        throw RentalError.paymentFailed
    }
    
    return "Car rented successfully!"
}
