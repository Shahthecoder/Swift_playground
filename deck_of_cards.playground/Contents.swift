//: Playground - noun: a place where people can play

import UIKit
//1
struct Card {
    var value: String
    var Suit: String
    var numreical_value: Int
    func show(){
        print(value, "of", Suit, ":value", numreical_value)
    }
}

//2
class Deck {
    var cards = [Card]()
    
    init(){
        self.reset()
    }
    
    func deal() -> Card? {
        if self.cards.count > 0 {
            return self.cards.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func reset(){
        let values = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
        let Suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
        self.cards = [Card]()
        for Suit in Suits {
            for i in 0...12 {
                let newCard = Card(value: values[i], Suit: Suit, numreical_value: i+1)
                self.cards.append(newCard)
            }
        }
    }
    
    func shuffle(){
        for i in stride(from: self.cards.count-1, to: 0, by: -1) {
            let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
            let temp = self.cards[i]
            self.cards[i] = self.cards[swapCardIndex]
            self.cards[swapCardIndex] = temp
        }
    }
    
    func show(){
        for card in self.cards {
            card.show()
        }
    }
}

//3
class Player {
    var name: String
    var hand: [Card]
    
    init(name: String){
        self.name = name
        self.hand = [Card]()
    }
    
    func draw(deck:Deck) -> Card? {
        if let drawnCard = deck.deal() {
            self.hand.append(drawnCard)
            return drawnCard
        }
        else {
            return nil
        }
    }
    
    func discard(Suit: String, value: String) -> Bool {
        for i in 0...self.hand.count-1 {
            if (self.hand[i].Suit == Suit && self.hand[i].value == value) {
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func show(){
        for card in self.hand {
            card.show()
        }
    }
}

//4
let newDeck = Deck()

print("<<<<<<<<<<< New deck was made >>>>>>>>>>>>")
newDeck.show()

newDeck.shuffle()

print("<<<<<<<<<<< New deck was shuffled >>>>>>>>>>>")
newDeck.show()

let joe = Player(name: "Joe")

joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)

print("<<<<<<<<<<<<<<< Joe's hand >>>>>>>>>>>>>>>>>")
joe.show()

print("<<<<<<<<<<<<<<< Joe's discard >>>>>>>>>>>>>>")
print(joe.discard(Suit: "Clubs", value: "Ace"))


