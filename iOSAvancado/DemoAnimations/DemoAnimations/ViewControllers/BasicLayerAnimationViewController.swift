//
//  BasicLayerAnimationViewController.swift
//  DemoAnimations
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class BasicLayerAnimationViewController: UIViewController {
    @IBOutlet weak var redBox: UIView!
    
    @IBAction func playAnimation(_ sender: Any) {
        let goRight = CABasicAnimation(keyPath: "position.x")
        goRight.fromValue = -view.bounds.size.width/2
        goRight.toValue = view.bounds.size.width
        goRight.duration = 0.5
        goRight.fillMode = .removed
        redBox.layer.add(goRight, forKey: nil)
    }
}
