//
//  StringsAndCharacters.swift
//  Practice
//
//  Created by Андрей Боловинцев on 12.06.24.
//

import Foundation

func stringsAndCharacters() {
    let str = "Some string literal value"

    let quotation = #"""

    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

      \"Begin at the beginning,\" the King said gravely, "and go on
    till you come to the end; then stop."

    """#
    print(quotation)


    let str1 = "snuvdi"
    print(str1)

    let str2 = "\u{2665}" // ♥,  Unicode scalar U+2665
    print(str2)


    var emptyString = "" //empty string literal
    var anotherEmptyString = String() //initializer syntax

    if emptyString.isEmpty {
        print("Nothing to see here")
    }


    var variableString = "Horse"
    variableString += " and carriage"
    print(variableString)


    for i in "Elephant🐘" {
        print(i)
    }


    let exclamationMark: Character = "a"

    let catCharacters: [Character] = ["C", "a", "t", "🐈"]
    let catString = String(catCharacters)
    print(catString)


    let string1 = "Hello,"
    let string2 = " World!"
    var welcome = string1 + string2
    print(welcome)


    var instruction = "look over"
    instruction += string2
    print(instruction)


    let multiplier = 3
    let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
    print(message)


    print(#"Write an interpolated string in Swift using \(multiplier)."#)



    let eAcute: Character = "\u{E9}"
    let combinedEAcute: Character = "\u{65}\u{301}"


    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
    print("unusualMenagerie has \(unusualMenagerie.count) characters")


    let greeting = "Guten Tag!"
    print(greeting[greeting.startIndex])
    print(greeting[greeting.index(before: greeting.endIndex)])
    print(greeting[greeting.index(after: greeting.startIndex)])
    print(greeting[greeting.index(greeting.startIndex, offsetBy: 6)])


    for index in greeting.indices {
        print("\(greeting[index]) ", terminator: "")
    }


    var welc = "hello"

    //Inserting and Removingin
    welc.insert("!", at: welc.endIndex)
    print("\n\(welc)")

    welc.insert(contentsOf: " there", at: welc.index(before: welc.endIndex))
    print(welc)

    print(welc.remove(at: welc.index(before: welc.endIndex)))

    let range = welc.index(welc.endIndex, offsetBy: -6)..<welc.endIndex
    welc.removeSubrange(range)
    print(welc)

    let v1 = "Hello, world!"
    let ind = v1.firstIndex(of: ",") ?? v1.endIndex
    let beginning = v1[..<ind]
    let newString = String(beginning)
    print(newString)



    //Comparing Stringsin
    let a1 = "We're a lot alike, you and I."
    let a2 = "We're a lot alike, you and I."
    if a1 == a2 {
        print("These two strings are considered equal")
    }

    let romeoAndJuliet = [
        "Act 1 Scene 1: Verona, A public place",
        "Act 1 Scene 2: Capulet's mansion",
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
        "Act 2 Scene 1: Outside Capulet's mansion",
        "Act 2 Scene 2: Capulet's orchard",
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
        "Act 2 Scene 4: A street in Verona",
        "Act 2 Scene 5: Capulet's mansion",
        "Act 2 Scene 6: Friar Lawrence's cell"
    ]

    var act1SceneCount = 0
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1 ") {
            act1SceneCount += 1
        }
    }
    print("There are \(act1SceneCount) scenes in Act 1")

    var mansionCount = 0
    var cellCount = 0
    for scene in romeoAndJuliet {
        if scene.hasSuffix("Verona, A public place") {
            mansionCount += 1
        } else if scene.hasSuffix("Friar Lawrence's cell") {
            cellCount += 1
        }
    }
    print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
    
    
    let str3 = "lion🦁"
    for i in str3.utf8 {
        print("\(i) ", terminator: "")
    }
    print()
    for i in str3.utf16 {
        print("\(i) ", terminator: "")
    }
}
