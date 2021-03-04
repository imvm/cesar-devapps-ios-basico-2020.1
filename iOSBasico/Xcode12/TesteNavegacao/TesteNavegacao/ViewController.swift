//
//  ViewController.swift
//  TesteNavegacao
//
//  Created by Ian Manor on 02/03/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController:viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController:viewDidAppear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController:viewDidLoad")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController:viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController:viewDidDisappear")
    }

    @IBAction func mostrarTela2(_ sender: Any) {
        guard let tela2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "tela3") else {
            fatalError("não encontrou a tela 3")
        }

        tela2ViewController.modalPresentationStyle = .fullScreen

        self.present(tela2ViewController, animated: false, completion: nil)
    }

    @IBAction func unwindToTela1(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print(sourceViewController.title)
        // Use data from the view controller which initiated the unwind segue
    }
}

