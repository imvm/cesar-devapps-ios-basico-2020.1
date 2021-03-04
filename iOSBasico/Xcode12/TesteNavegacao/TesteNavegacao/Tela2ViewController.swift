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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Tela2ViewController:viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Tela2ViewController:viewDidAppear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tela2ViewController:viewDidLoad")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Tela2ViewController:viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Tela2ViewController:viewDidDisappear")
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
