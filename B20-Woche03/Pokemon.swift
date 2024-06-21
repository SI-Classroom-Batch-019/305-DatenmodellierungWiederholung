//
//  Pokemon.swift
//  B20-Woche03
//
//  Created by Marianne Leal on 21.06.24.
//

import Foundation

struct Pokemon{
    let name: String
    var ap: Int
    var hp: Int
    
    func attackWithReturn(gegner: Pokemon) -> Int {
        // hitSuccess einbauen:
        // if else: wenn true rauskommt angreifen, wenn nicht dann nicht
        print("\(self.name) greift \(gegner.name) an!")
        return gegner.hp - self.ap
    }
    
    // inout: Parameter darf bearbeitet werden, geht ohne nicht
    func attack(gegner: inout Pokemon){
        if (gegner.hp > 0 && self.hp > 0){
            print("\(self.name) greift \(gegner.name) an!")
            gegner.hp -= self.ap
            print("\(gegner.name) hat noch \(gegner.hp) HP!")
        } else if gegner.hp <= 0 {
            print("\(gegner.name) ist bereits besiegt und kann nicht angegriffen werden!")
        } else if self.hp <= 0 {
            print("\(self.name) ist bereits besiegt und kann nicht angreifen!")
        }
        
    }
}

var bisasam: Pokemon = Pokemon(name: "Bisasam", ap: 10, hp: 50)
var glumanda: Pokemon = Pokemon(name: "Glumanda", ap: 10, hp: 50)


func hitSuccess(precision: Int) -> Bool {
    return Int.random(in: 1...100) <= precision
}

/*
 Der Kampf dauert solange, bis einer der Pokemon keine Lebenspunkte mehr hat.
 Die Boxer schlagen abwechselnd zu.
 Die Kampfkraft bestimmt, wie viel Schaden ein Schlag dem anderen Boxer zufügt.
 Die Genauigkeit bestimmt, wie wahrscheinlich es ist, dass ein Schlag den anderen Boxer trifft. Wenn der Schlag nicht trifft, verursacht er keinen Schaden.
 Diese Funktion könnte beispielsweise, die Genauigkeit eines Boxers übergeben bekommen und dann true oder false zurückgeben, je nachdem ob ein Schlag getroffen hat oder nicht:
 */

func fightWithReturn(){
    // Der Kampf dauert solange, bis einer der Pokemon keine Lebenspunkte mehr hat.
    while(bisasam.hp > 0 && glumanda.hp > 0){
        glumanda.hp = bisasam.attackWithReturn(gegner: glumanda)
        print("\(glumanda.name) hat noch \(glumanda.hp) HP!")
        bisasam.hp = glumanda.attackWithReturn(gegner: bisasam)
        print("\(bisasam.name) hat noch \(bisasam.hp) HP!")
    }
}

func fight(){
    while(bisasam.hp > 0 && glumanda.hp > 0){
        // inout verlangt ein & vor dem variablennamen
        bisasam.attack(gegner: &glumanda)
        glumanda.attack(gegner: &bisasam)
    }
    print("Kampf vorbei!")
    // hier noch if abfrage, wer > 0 hat und gewonnen hat, dementsprechend gewinner/verlierer ausdrucken
}


