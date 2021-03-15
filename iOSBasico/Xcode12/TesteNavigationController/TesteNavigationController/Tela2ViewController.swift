//
//  Tela2ViewController.swift
//  TesteNavigationController
//
//  Created by Ian Manor on 03/03/21.
//

import UIKit

class Tela2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func mostrarSettings(_ sender: Any) {

    }
    
    @IBAction func irParaTela3(_ sender: Any) {
        guard let tela3ViewController = storyboard?.instantiateViewController(withIdentifier: "tela3") else {
            fatalError("não encontrou a tela 3")
        }

        self.navigationController?.pushViewController(tela3ViewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
