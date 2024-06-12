//
//  Basic Operators.swift
//  Practice
//
//  Created by Андрей Боловинцев on 11.06.24.
//

import Foundation

func basicOperators() {
    
    //MARK: - Подсчет скидок и налогов для товаров
    
    let arrPrices: [Double?] = [130, 80, nil, 122.5, 99.9]
    let arrPresents: [Int?] = [nil, 15, 12, 2, 7]
    let arrTaxRates: [Int?] = [13, 4, 6, nil, 5]
    
    //Logical Operators
    guard arrPrices.count == arrPresents.count && arrPrices.count == arrTaxRates.count else { return }
    
    var totalCost = 0.0
    
    //Range Operatorsin
    for i in 0..<arrPrices.count {
        
        let price = arrPrices[i] ?? 0
        let present = arrPresents[i] ?? 0
        let taxRate = arrTaxRates[i] ?? 0
        
        //Logical Operators
        guard price >= 0, present >= 0 && present <= 100, taxRate >= 0 && taxRate <= 100 else { continue }
        
        let sumDiscount = price * Double(present) / Double(100)
        let priseWithDiscount = price - sumDiscount
        
        let taxAmount = priseWithDiscount * (Double(taxRate) / Double(100))
        let finalPrice = priseWithDiscount + taxAmount
        
        print("Товар №\(i + 1):")
        print("  Исходная цена: \(price)")
        print("  Процент скидки: \(present)%")
        print("  Налоговая ставка: \(taxRate)")
        print("  Цена после скидки: \(priseWithDiscount)")
        print("  Итоговая стоимость с учетом налога: \(finalPrice)\n")
        
        //Compound Assignment Operatorsin
        totalCost += finalPrice
    }
    
    print("Общая стоимость всех товаров: \(String(format: "%.2f", totalCost))")
    
    
    
    var arr: [Int] = []
    for i in 0...15 {
        arr.append(i)
    }
    let num = 6
    //Logical Operatorsin
    if !arr.isEmpty {
        print(arr.contains(num))
    }
    
    
    //Ternary Conditional Operatorin
    let a = 40
    let b = true
    let c = a + (b ? 50 : 20)
    print(c)
}
