//
//  DemoCoordinator.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

class DemoCoordinator: BaseCoordinator {
    var router: Router?
    var currentStep = 0
    var maxSteps = 5

    init(router: Router?) {
        self.router = router
        super.init()
    }

    override func start() {
        let startViewController = StartViewController()
        startViewController.delegate = self
        router?.push(startViewController, isAnimated: true, onNavigateBack: nil)
    }

    private func goToNextStep() {
        let nextStep = currentStep + 1
        print("currentStep: \(currentStep)")

        if nextStep > maxSteps {
            let finishViewController = FinishViewController()
            finishViewController.delegate = self
            router?.push(finishViewController, isAnimated: true, onNavigateBack: nil)
        } else {
            let nextStepViewController = StepViewController(currentStep: nextStep, maxSteps: maxSteps)
            nextStepViewController.delegate = self
            router?.push(nextStepViewController, isAnimated: true, onNavigateBack: { self.currentStep -= 1 })
            currentStep = nextStep
        }
    }
}

extension DemoCoordinator: StartViewControllerDelegate {
    func startViewControllerDidPressStart(_ controller: StartViewController) {
        goToNextStep()
    }
}

extension DemoCoordinator: StepViewControllerDelegate {
    func stepViewControllerDidPressNext(_ controller: StepViewController) {
        goToNextStep()
    }
}

extension DemoCoordinator: FinishViewControllerDelegate {
    func finishViewControllerDidPressStartOver(_ controller: FinishViewController) {
        currentStep = 0
        router?.popToRoot(true)
    }
}
