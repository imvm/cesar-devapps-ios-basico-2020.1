//
//  KeyframeLayerAnimationViewController.swift
//  DemoAnimations
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class KeyframeLayerAnimationViewController: UIViewController {
    @IBOutlet weak var redBox: UIView!
    

    @IBAction func playAnimation(_ sender: Any) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0, 300, 0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 2
        animation.isAdditive = true

        redBox.layer.add(animation, forKey: "move")
    }
}
