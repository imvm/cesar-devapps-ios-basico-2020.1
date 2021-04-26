//
//  ViewPropertyAnimatorViewController.swift
//  DemoAnimations
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class ViewPropertyAnimatorViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var redBox: UIView!
    var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.redBox.center.x = self.view.frame.width
            self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value)
    }
}
