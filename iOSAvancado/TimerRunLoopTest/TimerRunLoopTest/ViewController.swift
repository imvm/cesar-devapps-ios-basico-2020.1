//
//  ViewController.swift
//  TimerRunLoopTest
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    var tempoFaltando = 100
    @IBOutlet weak var tempoFaltandoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }

    func startTimer() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(performAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }

    @objc func performAction() {
        tempoFaltando -= 1
        tempoFaltandoLabel.text = "\(tempoFaltando)"
    }
}

