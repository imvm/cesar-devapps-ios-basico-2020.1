//
//  ViewController.swift
//  DemoCoordinator
//
//  Created by Ian Manor on 13/04/21.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func startViewControllerDidPressStart(_ controller: StartViewController)
}

class StartViewController: UIViewController {
    weak var delegate: StartViewControllerDelegate?
    private var maxSteps = 5

    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Começar Navegação", for: .normal)
        startButton.setTitleColor(.systemBlue, for: .normal)
        startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
        return startButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }

    private func setupViews() {
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc
    private func didTapStart(_ button: Any) {
        delegate?.startViewControllerDidPressStart(self)
    }
}

