//
//  ViewController.swift
//  OlaMundo
//
//  Created by Ian Manor on 01/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var meuSwitch: UISwitch!
    @IBOutlet weak var minhaImageView: UIImageView!

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

    @IBAction func olaMundo(_ sender: Any) {
        print("ola mundo")
        helloLabel.isHidden = !helloLabel.isHidden
    }

    @IBAction func switchLabel(_ sender: Any) {
        print("trocou")
        helloLabel.isHidden = meuSwitch.isOn
        minhaImageView.isHidden = meuSwitch.isOn
    }
}

