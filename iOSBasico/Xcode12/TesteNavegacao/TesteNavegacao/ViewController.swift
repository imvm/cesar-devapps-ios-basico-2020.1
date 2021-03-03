//
//  ViewController.swift
//  TesteNavegacao
//
//  Created by Ian Manor on 02/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func mostrarTela2(_ sender: Any) {
        guard let tela2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "tela3") else {
            fatalError("não encontrou a tela 3")
        }

        tela2ViewController.modalPresentationStyle = .fullScreen

        self.present(tela2ViewController, animated: false, completion: nil)
    }

}

