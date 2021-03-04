//
//  Tela4ViewController.swift
//  TesteNavegacao
//
//  Created by Ian Manor on 03/03/21.
//

import UIKit

class Tela4ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Tela4ViewController:viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Tela4ViewController:viewDidAppear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tela4ViewController:viewDidLoad")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Tela4ViewController:viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Tela4ViewController:viewDidDisappear")
    }
}
