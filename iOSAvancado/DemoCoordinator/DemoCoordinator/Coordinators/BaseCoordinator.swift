//
//  BaseCoordinator.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
}
