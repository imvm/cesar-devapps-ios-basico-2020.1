//
//  AppCoordinator.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() {
        let navigationController = UINavigationController()
        let router = NavigationRouter(navigationController: navigationController)
        let demoCoordinator = DemoCoordinator(router: router)

        self.store(coordinator: demoCoordinator)
        demoCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        demoCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: demoCoordinator)
        }
    }
}
