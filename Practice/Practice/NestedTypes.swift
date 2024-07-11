//
//  NestedTypes.swift
//  Practice
//
//  Created by Андрей Боловинцев on 11.07.24.
//

import Foundation

func nestedTypes() {
    let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
    print("theAceOfSpades: \(theAceOfSpades.description)")
    
    let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
    print(heartsSymbol)
    
    
    
    let pizza = Pizza(toppings: ["Cheese", "Ham", "Tomato", "Cucumber", "Sauce"], dough: Pizza.Dough(crustType: .thin, size: .large))
    print(pizza.getDescription())
}

struct BlackjackCard {
    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        
        case six = 6, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        
        if let second = rank.values.second 
        {
            output += " or \(second)"
        }
        
        return output
    }
}



struct Pizza {
    enum Size: String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
    
    struct Dough {
        enum CrustType: String {
            case thin = "Thin"
            case thick = "Thick"
        }
        
        var crustType: CrustType
        var size: Size
        
        func getDescription() -> String {
            return "Dough \(crustType.rawValue), \(size.rawValue) size"
        }
    }
    
    var toppings: [String]
    var dough: Dough
    
    func getDescription() -> String {
        var toppingsList = ""
        for (index, topping) in toppings.enumerated()
        {
            if index > 0
            { 
                toppingsList += ", "
            }
            toppingsList += topping
        }
        return "\(dough.getDescription()), with toppings: \(toppingsList)"
    }
}
