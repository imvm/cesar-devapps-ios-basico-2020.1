//
//  Coordinator.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

protocol Coordinator: AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
