//
//  Tela2ViewController.swift
//  TesteNavegacao
//
//  Created by Ian Manor on 02/03/21.
//

import UIKit

class Tela2ViewController: UIViewController {
    @IBOutlet weak var meuBotao: UIButton!
    @IBOutlet weak var meuSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
    }
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func irParaProximaTela(_ sender: Any) {
        if meuSwitch.isOn {
            irTela3()
        } else {
            irTela4()
        }
    }

    @IBAction func mudouDeValor(_ sender: Any) {
        if meuSwitch.isOn {
            meuBotao.setTitle("Ir para tela 3", for: .normal)
        } else {
            meuBotao.setTitle("Ir para tela 4", for: .normal)
        }
    }

    func irTela3() {
        self.performSegue(withIdentifier: "irTela3", sender: nil)
    }

    func irTela4() {
        self.performSegue(withIdentifier: "irTela4", sender: nil)
    }
}
