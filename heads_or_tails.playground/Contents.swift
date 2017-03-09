//: Playground - noun: a place where people can play

import UIKit

func tossCoin() -> String {
    let coin = Int(arc4random_uniform(UInt32(2)))
    
    if coin == 0 {
        return "Heads"
    }else {
        return "Tails"
    }
    
}

func tossMultipleCoins(tosses: Int) -> Double {
    
    var headsCount = 0
    var tailsCount = 0
    
    for _ in 0...tosses {
        if tossCoin() == "Heads" {
            headsCount += 1
        }else {
            tailsCount += 1
        }
    }
    
    return Double(tosses) / Double(headsCount)
}


tossMultipleCoins(tosses: 10)