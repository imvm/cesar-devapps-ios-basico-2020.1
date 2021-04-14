//
//  Router.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

protocol Router: AnyObject {
    func push(_ viewController: UIViewController, isAnimated: Bool, onNavigateBack: (() -> Void)?)
    func pop(_ isAnimated: Bool)
    func popToRoot(_ isAnimated: Bool)
}
