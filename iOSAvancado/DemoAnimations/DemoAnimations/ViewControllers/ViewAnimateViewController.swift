//
//  ViewAnimateViewController.swift
//  DemoAnimations
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class ViewAnimateViewController: UIViewController {
    @IBOutlet weak var redBox: UIView!
    
    @IBAction func playAnimation(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            self.redBox.center.x = 200
            self.redBox.center.y = 500
            self.redBox.alpha = 0.8
            self.redBox.backgroundColor = .green
        }) { (_) in
            print("terminou")
        }
    }
}
