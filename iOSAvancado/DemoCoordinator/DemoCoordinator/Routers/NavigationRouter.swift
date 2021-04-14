//
//  NavigationRouter.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

class NavigationRouter: NSObject, Router {
    let navigationController: UINavigationController
    private var closures: [UIViewController: () -> Void?] = [:]

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func push(_ viewController: UIViewController, isAnimated: Bool, onNavigateBack closure: (() -> Void)?) {
        if let closure = closure {
            closures.updateValue(closure, forKey: viewController)
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }

    func pop(_ isAnimated: Bool) {
        navigationController.popViewController(animated: isAnimated)
    }

    func popToRoot(_ isAnimated: Bool) {
        navigationController.popToRootViewController(animated: isAnimated)
    }

    private func executeClosure(_ viewController: UIViewController) {
        guard let closure = closures.removeValue(forKey: viewController) else { return }
        closure()
    }
}

extension NavigationRouter: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(previousController) else {
            return
        }
        executeClosure(previousController)
    }
}
