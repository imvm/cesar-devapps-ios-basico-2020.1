//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Ian Manor on 16/03/21.
//

import UIKit

class PasswordsViewController: UIViewController {
    @IBOutlet weak var tvPasswords: UITextView!

    var numberOfCharacters = 10 // default se usuario nao enviar
    var numberOfPasswords = 1
    var useLowercaseLetters = false
    var useNumbers = false
    var useUppercaseLetters = false
    var useSpecialCharacters = false

    var passwordGenerator: PasswordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordGenerator = PasswordGenerator(
            numberOfCharacters: numberOfCharacters,
            useLetters: useLowercaseLetters,
            useNumbers: useNumbers,
            useCapitalLetters: useUppercaseLetters,
            useSpecialLetters: useSpecialCharacters
        )
    }

    @IBAction func gerarSenha(_ sender: Any) {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
        tvPasswords.text = "" // limpa a view

        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
}
