//
//  Deinitialization.swift
//  Practice
//
//  Created by Андрей Боловинцев on 28.06.24.
//

import Foundation

func deinitialization() {
    
    var playerOne: Player1? = Player1(coins: 5)
    print(playerOne!.coinsInPurse)
    print(Bank.coinsInBank)
    
    playerOne!.win(coins: 10)
    print(playerOne!.coinsInPurse)
    print(Bank.coinsInBank)
    
    playerOne = nil
    print("PlayerOne has left the game")
    print(Bank.coinsInBank)
    
}

class Bank {
    
    static var coinsInBank = 100
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
class Player1 {
    
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
