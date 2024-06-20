//
//  Structures And Classes.swift
//  Practice
//
//  Created by Андрей Боловинцев on 19.06.24.
//

import Foundation

struct Resolution {
    var height = 0
    var width = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

enum CompassPoint1 {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

func structuresAndClasses() {
    
    let someResolution = Resolution()
    let someVideoMode = VideoMode()
    
    print("The width of someResolution is \(someResolution.width)")
    print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    
    someVideoMode.resolution.width = 1280
    print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
    
    let vga = Resolution(height: 480, width: 640)
    let hd = Resolution(height: 1080, width: 1920)
    var cinema = hd
    cinema.width = 2048
    
    print(hd.height)
    print(cinema.height)
    
    
    var currentDirection = CompassPoint1.west
    let rememberedDirection = currentDirection
    currentDirection.turnNorth()

    print(currentDirection)
    print(rememberedDirection)
    
    
    
    let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1080i"
    tenEighty.frameRate = 25.0
    
    print(tenEighty.frameRate)
    
    let alsoTenEighty = tenEighty
    alsoTenEighty.frameRate = 30.0
    
    print("TenEighty: \(tenEighty.frameRate)")
    print("AlsoTenEighty: \(alsoTenEighty.frameRate)")
    
    
    if tenEighty === alsoTenEighty {
        print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
    }
}
