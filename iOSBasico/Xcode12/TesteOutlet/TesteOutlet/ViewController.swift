//
//  ViewController.swift
//  TesteOutlet
//
//  Created by Ian Manor on 03/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var meusBotoes: [UIButton]!
    @IBOutlet weak var botao9: UIButton!
    @IBOutlet weak var botao10: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        meusBotoes.forEach { button in
            button.backgroundColor = .green
        }

        imprimirAlgo()

        print(meusBotoes.contains(botao9))
        print(meusBotoes.contains(botao10))
    }

    func imprimirAlgo() {
        print("oi")
    }

    @IBAction func digitarNumero(_ sender: UIButton) {
        if let numero = sender.titleLabel?.text {
            print(numero)
        }
    }
}

