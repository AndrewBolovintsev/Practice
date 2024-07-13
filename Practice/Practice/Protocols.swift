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
    
    
    let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    if twoThreeFour == anotherTwoThreeFour {
        print("These two vectors are also equivalent.")
    }
    
    
    var levels = [SkillLevel.intermediate, SkillLevel.beginner,
                  SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
    for level in levels.sorted() {
        print(level)
    }
    
    
    let things: [TextRepresentable2] = [Hamster(name: "Alex"), simonTheHamster, Hamster(name: "Mike")]
    for thing in things {
        print(thing.textualDescription2)
    }
    
    let person7: Car6 = Person7()
    print(person7.driverLicense)
    
    
    let birthdayPerson = Person8(name: "Malcolm", age: 21)
    wishHappyBirthday(to: birthdayPerson)
    
    let seattle = City2(name: "Seattle", latitude: 47.6, longitude: -122.3)
    beginConcert(in: seattle)
    
    
    
    let objects: [AnyObject] = [
        Circle(radius: 2.0),
        Country2(area: 243_610),
        Animal2(legs: 4)
    ]
    
    for object in objects {
        if object is HasArea {
            print("true")
        } else {
            print("false")
        }
    }
    
    for object in objects {
        if let objectWithArea = object as? HasArea {
            print("Area is \(objectWithArea.area)")
        } else {
            print("Something that doesn't have an area")
        }
    }
    
    
    
    var counter = Counter3()
    counter.dataSource = ThreeSource()
    for _ in 1...4 {
        counter.increment()
        print(counter.count)
    }
    
    counter.count = -4
    counter.dataSource = TowardsZeroSource()
    for _ in 1...5 {
        counter.increment()
        print(counter.count)
    }
    
    
    
    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())")
    print("And here's a random Boolean: \(generator.randomBool())")
    
    
    
    let example = Example()
    print(example.prettyTextualDescription)

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



struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}


enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}



protocol Car6: Drive {
    var driverLicense: Bool { get }
}
class Person7 {
    var name: String = "Alex"
}
extension Person7: Car6 {
    var driverLicense: Bool {
        true
    }
    
    static var speed: Int {
        50
    }
    
    static func drive() -> String {
        "Person drive!"
    }
}



protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person8: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}



class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City2: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}



protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country2: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
class Animal2 {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}



@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
class Counter3 {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) 
        {
            count += amount
        } 
        else if let amount = dataSource?.fixedIncrement
        {
            count += amount
        }
    }
}
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}



protocol RandomNumberGenerator {
    func random() -> Double
}
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}



protocol TextRepresentable3 {
    var textualDescription: String { get }
}
protocol PrettyTextRepresentable: TextRepresentable3 {
    var prettyTextualDescription: String { get }
}
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
struct Example: PrettyTextRepresentable {
    var textualDescription: String {
        return "This is an example."
    }
}
