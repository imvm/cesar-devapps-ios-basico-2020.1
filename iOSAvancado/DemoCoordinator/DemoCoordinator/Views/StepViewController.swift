//
//  StepViewController.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

protocol StepViewControllerDelegate: AnyObject {
    func stepViewControllerDidPressNext(_ controller: StepViewController)
}

class StepViewController: UIViewController {
    weak var delegate: StepViewControllerDelegate?
    private let currentStep: Int
    private let maxSteps: Int

    private lazy var currentStepLabel: UILabel = {
        let currentStepLabel = UILabel()
        currentStepLabel.translatesAutoresizingMaskIntoConstraints = false
        currentStepLabel.text = "Tela \(currentStep)"
        return currentStepLabel
    }()

    private lazy var nextStepButton: UIButton = {
        let nextStepButton = UIButton()
        nextStepButton.translatesAutoresizingMaskIntoConstraints = false
        let title = currentStep == maxSteps ? "Ir para o final" : "Próximo"
        nextStepButton.setTitle(title, for: .normal)
        nextStepButton.setTitleColor(.systemBlue, for: .normal)
        nextStepButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        return nextStepButton
    }()

    private lazy var stepStackView: UIStackView = {
        let stepStackView = UIStackView(arrangedSubviews: [currentStepLabel, nextStepButton])
        stepStackView.translatesAutoresizingMaskIntoConstraints = false
        stepStackView.axis = .vertical
        stepStackView.spacing = 20
        return stepStackView
    }()

    init(currentStep: Int, maxSteps: Int) {
        self.currentStep = currentStep
        self.maxSteps = maxSteps
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }

    private func setupViews() {
        view.addSubview(stepStackView)

        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: stepStackView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: stepStackView.centerYAnchor)
        ])
    }

    @objc
    private func didTapNext(_ button: Any) {
        delegate?.stepViewControllerDidPressNext(self)
    }
}
