//
//  Smartphone.swift
//  B20-Woche03
//
//  Created by Marianne Leal on 21.06.24.
//

import Foundation

// struct Smartphone erstellen, das marke (brand), modell, batteryLevel und batteryStatus, besitzer (owner)

struct Smartphone {
    let brand: String
    let model: String
    var batteryLevel: Int {
        // didSet reagiert auf änderungen, sobald ich batteryLevel verändere, greift didSet.
        didSet{
            // Batterie darf nicht ueber 100 gesetzt werden
            if batteryLevel > 100 {
                print("Overcharged! Das Handy kann nicht über 100 geladen werden! Wir setzen die Batterie stattdessen auf 100....")
                batteryLevel = 100
            }
            // Batterie darf nicht unter 0 gesetzt werden
            else if batteryLevel < 0 {
                print("Undercharged! Das Handy kann nicht unter 0 geladen sein! Wir setzen die Batterie stattdessen auf 0....")
                batteryLevel = 0
            }
            else {
                print("Batterie auf \(batteryLevel) gesetzt")
            }
            
        }
    }
    
    // weil batteryStatus von batteryLevel abhängig ist, ist es zum Zeitpunkt der Initialisierung NICHT fertig. wenn ich also einen setter habe, der von anderen Attributen abhängig ist, will ich ihn sowieso nicht im initializer haben/selber schreiben, es soll ja von der batterie abhängen.
    var batteryStatusMsg: String {
        get {
            if batteryLevel > 80 {
                return "Batterie voll geladen"
            } else if batteryLevel > 30 {
                return "Batterie mittel"
            } else {
                return "Batterie niedrig"
            }
        }
        set {
            switch newValue {
            case "Batterie voll geladen":
                batteryLevel = 100
            case "Batterie mittel":
                batteryLevel = 50
            case "Batterie niedrig":
                batteryLevel = 10
            default:
                print("Unbekannter Status...")
                
            }
            
        }
    }
    
    // Hilfsvariable: 2. Owner, der den gleichen Wert wie owner haben soll
    var _owner: String
    // get und set
    var owner: String{
        get{
            return _owner
        }
        // set: geschieht eigentlich automatisch/implizit, erstelle ich nur, wenn ich zusätzliche Logik/ Nebeneffekte haben moechte.
        // newValue ist automatisch der neue Wert.
        // wenn ich smartphone.owner = "Sina Sonntag" schreibe, ist "Sina Sonntag" unser newValue. Also immer die rechte Seite des =
        set{
            print("Besitzer gewechselt zu \(newValue)")
            _owner = newValue
        }
    }
    
    // initializer: eigentlich automatisch/implizit
    init(brand: String, model: String, batteryLevel: Int, batteryStatusMsg: String, owner: String) {
        self.brand = brand
        self.model = model
        self.batteryLevel = batteryLevel
        
        // wenn ich get und set habe, kann ich den owner nicht normal setzen, deshalb schreibe ich den wert "Max Mustermann in die Hilfsvariable _owner hole mir im owner-getter aus _owner den wert
        self._owner = owner
        // expliziter Setter darf nicht aufgerufen werden, bevor alle Eigenschaften initialisiert sind. Dies liegt daran, dass der Setter möglicherweise auf self zugreift und damit auf andere Eigenschaften des Structs, die noch nicht initialisiert wurden
        // Attribute mit explizitem Getter/Setter and Ende schreiben
        self.batteryStatusMsg = batteryStatusMsg
        // initialisierungslogik: zB Nebeneffekte, die stattfinden sollen, sobald ein Smartphone erstellt wird, oder Validierung, wenn irgendein Attribut einen bestimmten Zustand hat, irgendwas bestimmtes machen (Funktion aufrufen, Daten laden, etc.)
        print("Smartphone erstellt! Mit den Eigenschaften: ....")
        
    }
    
    
    
    // mutating: erlaubt es der func, die Attribute/Properties zu verändern. ohne geht es nicht
    mutating func chargeBattery(amount: Int){
        batteryLevel += amount
    }
    
    mutating func useBattery(amount: Int){
        batteryLevel -= amount
    }
    
}
