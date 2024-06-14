//
//  Collection Types.swift
//  Practice
//
//  Created by Андрей Боловинцев on 12.06.24.
//

import Foundation

class Shape: Collection {
    typealias Element = String
    
    var startIndex: Int {
        return elements.startIndex
    }
    
    var endIndex: Int {
        return elements.endIndex
    }
    
    var elements: [Element]
    
    init(elements: [Element]) {
        self.elements = elements
    }
    
    subscript(position: Int) -> Element {
        return elements[position]
    }
    
    func index(after i: Int) -> Int {
        return elements.index(after: i)
    }
}

func collectionTypes() {
    
    let dfs = Shape(elements: ["wefaws", "wwefwesa", "sregeszd"])
    print(dfs)
    
    let dsf = "wrtegfsd"
    
    if dsf is (any Collection) {
        print("String is Collection")
    }
    else {
        print("String is not Collection")
    }
    
    //Array
    var arr: [Int] = []
    arr.append(3)
    print(arr)
    
    let arr1 = ArraySlice(repeating: 4, count: 3)
    let arr6 = Array(repeating: 4, count: 3)
    print(arr1)
    
    var arr2 = arr + arr1
    
    var shoppingList = ["Eggs", "Milk", "Limon", "Oranges"]
    
    print("The shopping list contains \(shoppingList.count) items.")
    
    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    } else {
        print("The shopping list isn't empty.")
    }
    
    shoppingList.append("Flour")
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    
    print(shoppingList[3])
    
    shoppingList[0] = "Six eggs"
    print(shoppingList)
    
    shoppingList[4...6] = ["Bananas", "Apples"]
    print(shoppingList)
    
    shoppingList.insert("Maple Syrup", at: 0)
    print(shoppingList)
    
    shoppingList.remove(at: 0)
    
    shoppingList.removeLast()
    
    for i in shoppingList {
        print(i)
    }
    
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index + 1): \(value)")
    }
    
    
    
    //Sets
    var letters = Set<Character>()
    letters.insert("a")
    
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    
    print("I have \(favoriteGenres.count) favorite music genres.")
    
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    
    favoriteGenres.insert("Jazz")
    
    favoriteGenres.remove("Rock")
    print(favoriteGenres)
    
    print(favoriteGenres.contains("Funk"))
    
    for i in favoriteGenres {
        print(favoriteGenres)
    }
    
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }
    
    let oddDigits: Set = [0, 1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    print(oddDigits.union(evenDigits).sorted()) // Создает один общий набор
    
    print(oddDigits.intersection(evenDigits).sorted()) // Набор из повторяющихся элементов
    
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted()) // Создают набор из элементов которые не повторяются
    
    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()) // Создают новый набор со значениями отсутствующими в указанном наборе
    
    
    let set1: Set = [1, 2]
    let set2: Set = [5, 4, 3, 2, 1]
    let set3: Set = [7, 8]
    
    print(set1.isSubset(of: set2)) // Определяет содержит ли все элементы в set2 (Содержит ли set2 все элементы set1)
    
    print(set2.isSuperset(of: set1)) // Содержит ли все значения в указанном наборе (Есть ли элементы из set2 в set1)
    
    print(set2.isDisjoint(with: set3)) // Определяет не содержат ли два набора общих значений
    
    
    
    //Dictionaries
    var dictionariesTest: [Int: Int] = [4: 4, 1: 1, 24: 24, 15: 15]
    
    dictionariesTest[16] = 16
    dictionariesTest[3] = 3
    
    print(dictionariesTest)
    print(dictionariesTest.count)
    
    if dictionariesTest.isEmpty {
        print("The dictionary is empty.")
    } else {
        print("The dictionary isn't empty.")
    }
    
    dictionariesTest[3] = 4
    print(dictionariesTest)
    
    if let oldValue = dictionariesTest.updateValue(23, forKey: 3) {
        print("The old value for 3 was \(oldValue)")
    }
    print(dictionariesTest)
    
    if let nameVar = dictionariesTest[3] {
        print("The nameVar of the dictionariesTest is \(nameVar).")
    } else {
        print("That numbers isn't in the dictionariesTest dictionary.")
    }
    
    dictionariesTest[3] = nil
    print(dictionariesTest)
    
    if let removedValue = dictionariesTest.removeValue(forKey: 15) {
        print("The removed numbers is \(removedValue).")
    } else {
        print("The dictionariesTest dictionary doesn't contain a value for 15.")
    }
    print(dictionariesTest)
    
    for (key, value) in dictionariesTest {
        print("\(key): \(value)")
    }
    
    for i in dictionariesTest.keys {
        print(i)
    }
    
    for i in dictionariesTest.values {
        print(i)
    }
    
    let arrKeys = [Int](dictionariesTest.keys)
    print(arrKeys)
    
    let arrValues = [Int](dictionariesTest.values)
    print(arrValues)
    
    print(dictionariesTest.sorted(by: { (x, y) in
        return x < y
    }))
}
