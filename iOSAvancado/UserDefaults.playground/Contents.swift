import UIKit

// Armazenando valores
let defaults = UserDefaults.standard
defaults.set(25, forKey: "Idade")                   // Int
defaults.set(true, forKey: "DarkModePreferred")     // Bool
defaults.set(10.0, forKey: "Nota")                  // Double

defaults.set("CESAR School", forKey: "Instituicao") // String
defaults.set(Date(), forKey: "DataMatricula")       // Date

let array = ["Bruno", "Renata", "Ivonaldo"]
defaults.set(array, forKey: "Devs")                 // Array

let dict = ["Nome": "Ian", "País": "DE"]
defaults.set(dict, forKey: "Paises")                // Dictionary

// Lendo valores
let idade = defaults.integer(forKey: "Idade")
let darkModePreferred = defaults.bool(forKey: "DarkModePreferred")
let devs = defaults.object(forKey: "Devs") as? [String] ?? [String]()

// Criando outra suite
let suiteName = "com.cesarschool.test"
let testDefaults = UserDefaults(suiteName: suiteName)!

testDefaults.object(forKey: "Devs")
testDefaults.set(10, forKey: "TestesExecutados")
testDefaults.integer(forKey: "TestesExecutados")

testDefaults.removePersistentDomain(forName: suiteName)
testDefaults.integer(forKey: "TestesExecutados")
