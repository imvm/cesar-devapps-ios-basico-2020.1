//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func enviarNotification(_ sender: Any) {
        scheduleNotification(id: 1, timeInterval: 3, title: "Minha notificação", body: "Meu texto")
        scheduleNotification(id: 2, timeInterval: 3.1, title: "Minha notificação", body: "Meu texto")
        scheduleNotification(id: 3, timeInterval: 3.2, title: "Minha notificação", body: "Meu texto")
    }

    func scheduleNotification(id: Int, timeInterval: TimeInterval, title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

//        let calendar = Calendar(identifier: .gregorian)
//        let components = calendar.dateComponents(
//            [.year, .month, .day, .hour, .minute],
//            from: dueDate)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(
            identifier: "\(id)",
            content: content,
            trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }

}

