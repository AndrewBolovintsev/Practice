//
//  Macros.swift
//  Practice
//
//  Created by Андрей Боловинцев on 8.07.24.
//

import Foundation

func macros() {
    myFunction()
    
    
}

func myFunction() {
    print("Currently running \(#function)")
    #warning("Something's wrong")
}
