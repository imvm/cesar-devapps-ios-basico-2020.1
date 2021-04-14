//
//  FinishViewController.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

protocol FinishViewControllerDelegate: AnyObject {
    func finishViewControllerDidPressStartOver(_ controller: FinishViewController)
}

class FinishViewController: UIViewController {
    weak var delegate: FinishViewControllerDelegate?
    
    private lazy var finishLabel: UILabel = {
        let finishLabel = UILabel()
        finishLabel.translatesAutoresizingMaskIntoConstraints = false
        finishLabel.text = "Você chegou no final!"
        return finishLabel
    }()

    private lazy var startOverButton: UIButton = {
        let startOverButton = UIButton()
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        startOverButton.setTitle("Voltar para o começo", for: .normal)
        startOverButton.setTitleColor(.systemBlue, for: .normal)
        startOverButton.addTarget(self, action: #selector(didTapStartOver), for: .touchUpInside)
        return startOverButton
    }()

    private lazy var stepStackView: UIStackView = {
        let stepStackView = UIStackView(arrangedSubviews: [finishLabel, startOverButton])
        stepStackView.translatesAutoresizingMaskIntoConstraints = false
        stepStackView.axis = .vertical
        stepStackView.spacing = 20
        return stepStackView
    }()

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
    private func didTapStartOver(_ button: Any) {
        delegate?.finishViewControllerDidPressStartOver(self)
    }
}
