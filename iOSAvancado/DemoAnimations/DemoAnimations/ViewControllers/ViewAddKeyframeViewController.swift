//
//  ViewAddKeyframeViewController.swift
//  DemoAnimations
//
//  Created by Ian Manor on 14/04/21.
//

import UIKit

class ViewAddKeyframeViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var redBox: UIView!
    var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        animator = .init(duration: 5, curve: .easeInOut) {
            UIView.animateKeyframes(withDuration: 1, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0.0,
                                   relativeDuration: 0.25) {
                    self.redBox.transform = CGAffineTransform(rotationAngle: -.pi/8)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25,
                                   relativeDuration: 0.75) {
                    self.redBox.transform = CGAffineTransform(rotationAngle: +.pi/8)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75,
                                   relativeDuration: 1.0) {
                    self.redBox.transform = CGAffineTransform.identity
                }
            }
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value)
    }
}
