//
//  Protocols.swift
//  Practice
//
//  Created by Андрей Боловинцев on 11.07.24.
//

import Foundation

func protocols() {
    print(Car5.drive())
    
    let someClass2 = SomeClass2(someParameter: 4)
    print(someClass2.someParameter)
    
    let tracker = DiceGameTracker()
    let game = DiceGame(sides: 6)
    game.delegate = tracker
    game.play(rounds: 3)
    
    let dice = Dice()
    print(dice.textualDescription)
    
    
    let people = [Person5(name: "Alice"), Person5(name: "Bob"), Person5(name: "Charlie")]
    print(people.textualDescription2)

    let dogs = [Dog5(name: "Rex"), Dog5(name: "Buddy")]
    //print(dogs.textualDescription2) - Error
    
    
    let simonTheHamster = Hamster(name: "Simon")
    let somethingTextRepresentable: TextRepresentable2 = simonTheHamster
    print(somethingTextRepresentable.textualDescription2)
}

protocol Drive {
    static var speed: Int { get }
    static func drive() -> String
}

struct Car5: Drive {
    
    var isDocument = true
    
    
    static var speed: Int = 32
    
    static func drive() -> String {
        return "Drive a car, with speed = \(speed)"
    }
}



protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch1: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}


protocol SomeProtocol {
    init(someParameter: Int)
}
final class SomeClass2: SomeProtocol {
    var someParameter: Int
    
    init(someParameter: Int) {
        self.someParameter = someParameter
    }
}
class SomeClass4: SomeProtocol {
    var someParameter: Int

    required init(someParameter: Int) {
       self.someParameter = someParameter
   }
}



class DiceGame {
    let sides: Int
    let generator = 4.5
    weak var delegate: Delegate?


    init(sides: Int) {
        self.sides = sides
    }


    func roll() -> Int {
        return Int(generator * Double(sides)) + 1
    }


    func play(rounds: Int) {
        delegate?.gameDidStart(self)
        for round in 1...rounds {
            let player1 = roll()
            let player2 = roll()
            if player1 == player2 {
                delegate?.game(self, didEndRound: round, winner: nil)
            } else if player1 > player2 {
                delegate?.game(self, didEndRound: round, winner: 1)
            } else {
                delegate?.game(self, didEndRound: round, winner: 2)
            }
        }
        delegate?.gameDidEnd(self)
    }


    protocol Delegate: AnyObject {
        func gameDidStart(_ game: DiceGame)
        func game(_ game: DiceGame, didEndRound round: Int, winner: Int?)
        func gameDidEnd(_ game: DiceGame)
    }
}

class DiceGameTracker: DiceGame.Delegate {
    var playerScore1 = 0
    var playerScore2 = 0
    func gameDidStart(_ game: DiceGame) {
        print("Started a new game")
        playerScore1 = 0
        playerScore2 = 0
    }
    func game(_ game: DiceGame, didEndRound round: Int, winner: Int?) {
        switch winner {
            case 1:
                playerScore1 += 1
                print("Player 1 won round \(round)")
            case 2: playerScore2 += 1
                print("Player 2 won round \(round)")
            default:
                print("The round was a draw")
        }
    }
    func gameDidEnd(_ game: DiceGame) {
        if playerScore1 == playerScore2 {
            print("The game ended in a draw.")
        } else if playerScore1 > playerScore2 {
            print("Player 1 won!")
        } else {
            print("Player 2 won!")
        }
    }
}



protocol TextRepresentable {
    var textualDescription: String { get }
}
class Dice {
    var sides = 3
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        "A \(sides)-sided dice"
    }
}


protocol TextRepresentable2 {
    var textualDescription2: String { get }
}
extension Array: TextRepresentable2 where Element: TextRepresentable2 {
    var textualDescription2: String {
        let itemsAsText = self.map { $0.textualDescription2 }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
struct Person5: TextRepresentable2 {
    var name: String

    var textualDescription2: String {
        return name
    }
}
struct Dog5 {
    var name: String
}



struct Hamster {
    var name: String
    var textualDescription2: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable2 {}
