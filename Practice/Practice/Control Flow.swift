//
//  Control Flow.swift
//  Practice
//
//  Created by Андрей Боловинцев on 14.06.24.
//

import Foundation

class ControlFlow: Sequence, IteratorProtocol {
    
    var currentIndex = 0
    let elements = [1, 2, 3, 4, 5]
    
    // Функция для перехода к следующему элементу
    func next() -> Int? {
        guard currentIndex < elements.count else { return nil }
        defer { currentIndex += 1 }
        return elements[currentIndex]
    }
    
    // Реализуем метод makeIterator(), который возвращает экземпляр итератора
    func makeIterator() -> Iterator {
        return Iterator()
    }
}

func controlFlow() {
    
    //For-in Loops
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
    
    let countCar = ["Mersedes": 8, "BMW": 6, "Audi": 4]
    for (name, count) in countCar {
        print("\(name)s have \(count)")
    }
    
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base
    }
    print("\(base) to the power of \(power) is \(answer)")
    
    let minutes = 60
    for tickMark in 0..<minutes {
        print("\(tickMark)", terminator: " ")
    }
    
    for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
        let degrees = Int(radians * 180 / .pi)
        print("Degrees: \(degrees), radians: \(radians)")
    }
    
    for countdown in stride(from: 3, to: 0, by: -1) {
        print("\(countdown)", terminator: " ")
    }
    
    print()
    
    //Sequence
    let collect = ControlFlow()
    for i in collect {
        print("\(i)", terminator: " ")
    }
    
    //While Loops
    /*
     - while оценивает свое состояние в начале каждого прохода цикла.
     - repeat—while оценивает свое состояние в конце каждого прохода цикла.
     */
    
    print("Snakes")
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    print(board)
    var square = 0
    var diceRoll = 0
    
    while square < finalSquare {
        
        // roll the dicdiceRolle
        diceRoll += 1
        
        if diceRoll == 7 { diceRoll = 1 }
        
        // move by the rolled amount
        square += diceRoll
        
        if square < board.count {
            // if we're still on the board, move up or down for a snake or a ladder
            square += board[square]
        }
    }
    print("Game over!")
    
    //    repeat {
    //
    //        // move up or down for a snake or ladder
    //        square += board[square]
    //
    //        // roll the dice
    //        diceRoll += 1
    //
    //        if diceRoll == 7 { diceRoll = 1 }
    //
    //        // move by the rolled amount
    //        square += diceRoll
    //
    //    } while square < finalSquare
    //    print("Game over!")
    
    
    
    /*
     Игра
     Будет поле на 30 клеток, будет рандомным образом выпадать число от 1 до 6 на кубике
     Будут специальные клетки:
     1. Клетка 3, 12, 20 - возвращают игррока назад на 3 клетки
     2. Клетка 15 - продвигает игрока на 5 клеток вперед
     3. Клетка 24 - Возвращает игрока в начало
     */
    
    let finalSquare1 = 30
    var point = 0
    var diceRoll1 = 0
    
    while point < finalSquare1 {
        
        diceRoll1 = Int.random(in: 1...6)
        
        point += diceRoll1
        
        if point == 3 || point == 12 || point == 20 {
            point -= 3
            print("Вовращайтесь на 3 клетки назад")
        }
        else if point == 15 {
            point += 5
            print("Продвигайтесь на 5 клеток вперед")
        }
        else if point == 24 {
            point = 0
            print("Вовращайтесь вначало")
        }
    }
    print("Win!")
    
    //    repeat {
    //
    //        diceRoll1 = Int.random(in: 1...6)
    //
    //        point += diceRoll1
    //
    //        switch(point) {
    //        case 3, 12, 20:
    //            point -= 3
    //            print("Вовращайтесь на 3 клетки назад")
    //            break
    //        case 15:
    //            point += 5
    //            print("Продвигайтесь на 5 клеток вперед")
    //            break
    //        case 24:
    //            point = 0
    //            print("Вовращайтесь вначало")
    //            break
    //        default:
    //            break
    //        }
    //
    //    } while point < finalSquare
    //    print("Win!")
    
    
    //Conditional Statements
    var temperatureInCelsius = 15
    if temperatureInCelsius > 20 {
        print("It's very cold. Consider wearing a T-shirt.")
    }
    else if temperatureInCelsius > 10 {
        print("It's not that cold. Wear a sweatshirt.")
    }
    else {
        print("Dress warmly.")
    }
    
    let weatherAdvice = if temperatureInCelsius > 20 {
        "It's very cold. Consider wearing a T-shirt."
    } else if temperatureInCelsius > 10 {
        "It's not that cold. Wear a sweatshirt."
    } else {
        "Dress warmly."
    }
    print(weatherAdvice)
    
    let freezeWarning: String? = if temperatureInCelsius <= 0 {
        "It's below freezing. Watch for ice!"
    } else {
        nil
    }
    
    let freezeWarning1 = if temperatureInCelsius <= 0 {
        "It's below freezing. Watch for ice!"
    } else {
        nil as String?
    }
    
    do {
        let weatherAdvice1 = try checkTemperature(temperatureInCelsius: 30)
        print(weatherAdvice1)
    }
    catch TemperatureError.boiling {
        print("It's boiling hot!")
    }
    catch TemperatureError.cold {
        print("It's cold!")
    }
    catch {
        print("An error occurred: \(error)")
    }
    
    
    let num: Int = 5
    switch num {
    case 3:
        print(num)
    case 5:
        print(num)
    default:
        print("Number - \(num)")
    }
    
    let num1 = 45
    var str: String?
    switch num1 {
    case 0..<20:
        str = "Number from 0 to 20"
    case 20..<40:
        str = "Number from 20 to 40"
    case 40..<60:
        str = "Number from 40 to 60"
    default:
        str = "A number greater than 60 or less than 0"
    }
    print(str)
    
    let somePoint = (1, "sun", true)
    switch somePoint {
    case (0, nil, false):
        print(somePoint)
    case (_, "summer", true):
        print(somePoint)
    case (1, "winter", true):
        print(somePoint)
    case (0...5, "sun", true):
        print(somePoint)
    default:
        print(somePoint)
    }
    
    let anotherPoint = (2, 0)
    switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
    
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    }
    
    let someCharacter: Character = "e"
    switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) isn't a vowel or a consonant")
    }
    
    var arr: [Int] = []
    for i in 0...15 {
        if i % 2 == 0 {
            continue
        }
        arr.append(i)
    }
    print(arr)
    
    let char: Character = "🐼"
    var number: Int?
    
    switch char {
    case "1", "🦆", "-":
        number = 1
    case "2", "🙈", "=":
        number = 2
    case "3", "🐼", "/":
        number = 3
    default:
        break
    }
    if let number = number {
        print("The integer value of \(char) is \(number).")
    }
    else {
        print("An integer value couldn't be found for \(char).")
    }
    
    
    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
    }
    print(description)
    
    
    let finalSquare2 = 25
    var board2 = [Int](repeating: 0, count: finalSquare + 1)
    var square2 = 0
    var diceRoll2 = 0
    
    gameLoop: while square2 != finalSquare2 {
        diceRoll2 += 1
        if diceRoll2 == 7 { diceRoll2 = 1 }
        switch square2 + diceRoll2 {
        case finalSquare2:
            // diceRoll will move us to the final square, so the game is over
            break gameLoop
        case let newSquare2 where newSquare2 > finalSquare2:
            // diceRoll will move us beyond the final square, so roll again
            continue gameLoop
        default:
            // this is a valid move, so find out its effect
            square2 += diceRoll2
            square2 += board2[square2]
        }
    }
    print("Game over!")
    
    greet(person: ["name": "John", "city": "Minsk"])
    
    
    var score = 3
    if score < 10 {
        //3 in the queue
        defer {
            print(score)
        }
        //1 in the queue
        defer {
            print("The score is:")
        }
        score += 5
    }
    
    if #available(iOS 10, macOS 10.12, *) {
        print("Use the APIs of iOS 10 and above on iOS and mac OS 10.12 and above on mac OS")
    }
    else if #unavailable(iOS 10, macOS 10.12) {
        print("Use the iOS 10 and below APIs on iOS and mac OS 10.12 and below on mac OS")
    }
}

func greet(person: [String: String]) {
    guard let name = person["name"] else { return }
    
    print("Hello, \(name)")
    
    guard let city = person["city"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(city).")
}

func checkTemperature(temperatureInCelsius: Int) throws -> String {
    if temperatureInCelsius > 100 {
        throw TemperatureError.boiling
    }
    else if temperatureInCelsius < -25 {
        return "Cold!"
    }
    else {
        return "It's a reasonable temperature."
    }
}

enum TemperatureError: Error {
    case boiling
    case cold
}
