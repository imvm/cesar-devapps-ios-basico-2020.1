//: [Previous](@previous)

import Foundation

class TimerRunner {
    var timers: [Timer] = []

    func addTimer(for user: String, timeInterval: TimeInterval = 1) {
        timers.append(Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(performAction), userInfo: user, repeats: true))
    }

    @objc func performAction(timer: Timer) {
        guard let user = timer.userInfo as? String else { return }
        print("Timer disparado por \(user)!")
    }
}

let runner = TimerRunner()
runner.addTimer(for: "João", timeInterval: 1)
runner.addTimer(for: "Maria", timeInterval: 2)
runner.addTimer(for: "Reginaldo", timeInterval: 3)

//: [Next](@next)
