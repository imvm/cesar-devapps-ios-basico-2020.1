import Foundation

class TimerRunner {
    var timer: Timer?

    init() {
        createTimer()
    }

    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(performAction), userInfo: nil, repeats: true)
        // timer.tolerance = 0.2
    }

    @objc
    func performAction() {
        print("Passou cinco segundos!")
    }
}

let runner = TimerRunner()

//: [Next](@next)
