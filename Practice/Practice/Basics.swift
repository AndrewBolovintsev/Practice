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
    
    
}
