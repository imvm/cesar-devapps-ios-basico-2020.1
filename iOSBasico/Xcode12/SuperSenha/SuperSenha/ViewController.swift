//
//  ViewController.swift
//  SuperSenha
//
//  Created by Ian Manor on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLowercaseLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swUppercaseLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController

        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useUppercaseLetters = swUppercaseLetters.isOn
        passwordsViewController.useLowercaseLetters = swLowercaseLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn

        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
    }
}

