//: [Previous](@previous)

import Foundation

class TimerRunner {
    var count = 0
    var timer: Timer?

    init() {
        createTimer()
    }

    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(performAction), userInfo: nil, repeats: false)
    }

    @objc func performAction(timer: Timer) {
        count += 1
        print("Rodando pela \(count)a vez!")

        if count == 3 {
            timer.invalidate()
        }
    }
}

let runner = TimerRunner()

//: [Next](@next)
