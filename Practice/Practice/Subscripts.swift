//
//  Subscripts.swift
//  Practice
//
//  Created by Андрей Боловинцев on 24.06.24.
//

import Foundation

func subscripts() {
    
    let threeTimesTable = Test(multiplier: 3)
    print(threeTimesTable[6])
    
    
    var listShop = ["eggs": 10, "cheese": 2, "bread": 1]
    listShop["orange"] = 7
    print(listShop)
    
    
    let mars = Planet1[4]
    print(mars)
    
    
    var matrix = Matrix(rows: 2, columns: 2)
    matrix[0, 1] = 1.5
    matrix[1, 0] = 3.2
    print(matrix[1, 0])
}

struct Test {
    let multiplier: Int
    subscript(index: Int) -> Int {
        multiplier * index + index
    }
}


enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}


struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
}
