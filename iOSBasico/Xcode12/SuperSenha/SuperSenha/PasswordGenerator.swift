//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Ian Manor on 16/03/21.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int = 0
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    // 1 variavel para armazenar todas as senhas
    var passwords: [String] = []

    // 2 forma de filtrar os dados quando for gerar senhas
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%^&*()_-+=~`|]}[{':;?/<>.,"
    private let numbers = "1234567890"

    // 3 construtor da classe
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialLetters: Bool) {
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialLetters
    }

    // 4 função que gera a senha
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""

        if useLetters {
            universe += letters
        }

        if useNumbers {
            universe += numbers
        }

        if useSpecialCharacters {
            universe += specialCharacters
        }

        if useCapitalLetters {
            universe += letters.uppercased()
        }

        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                // obtem um indice aleatorio do universo escolhido
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }

        return passwords
    }
}
