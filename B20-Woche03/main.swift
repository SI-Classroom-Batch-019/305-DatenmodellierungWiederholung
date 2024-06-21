//
//  main.swift
//  B20-Woche03
//
//  Created by Marianne Leal on 21.06.24.
//

import Foundation

var smartphone: Smartphone = Smartphone(brand: "iPhone", model: "14S", batteryLevel: 50, batteryStatusMsg: "Batterie voll geladen", owner: "Max Mustermann")

// implizites set. mit smartphone.x = SETZE ich den wert x neu
smartphone.batteryLevel = 30

smartphone.chargeBattery(amount: 80)

smartphone.owner = "Sina Sonntag"

// implizit get: mit smartphone.owner gette ich den owner/hole ich mir den owner und drucke ihn in diesem fall
print(smartphone.owner)

smartphone.batteryStatusMsg = "niedrig"

print(smartphone.batteryLevel)

fight()
