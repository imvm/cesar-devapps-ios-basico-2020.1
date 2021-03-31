//
//  ViewController.swift
//  LoremIpsum
//
//  Created by Ian Manor on 30/03/21.
//

import UIKit
import LoremSwiftum

class ViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let myView: UIButton = {
        let myView = UIButton()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        myView.backgroundColor = .red
        return myView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Minha label"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var myStackView: UIStackView = {
        let myStackView = UIStackView(arrangedSubviews: [label, myView])
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .vertical
        return myStackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        title = "Lorem Ipsum"
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        //super.traitCollection
    }

    func configureLayout() {
        view.backgroundColor = .blue
        view.addSubview(scrollView)
        scrollView.addSubview(myStackView)

        let leadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
//        leadingConstraint.priority = .defaultLow // 250
//        leadingConstraint.priority = .defaultHigh // 750
//        leadingConstraint.priority = .required //

        leadingConstraint.priority = .defaultLow + 1 // 250
        leadingConstraint.identifier = "WidthConstraint"

        NSLayoutConstraint.activate([
            leadingConstraint,
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: myStackView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: myStackView.trailingAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: myStackView.topAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myStackView.bottomAnchor),
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: myStackView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            myView.heightAnchor.constraint(equalToConstant: 1000)
        ])

        //        NSLayoutConstraint.activate([
        //            view.centerXAnchor.constraint(equalTo: myStackView.centerXAnchor),
        //            view.centerYAnchor.constraint(equalTo: myStackView.centerYAnchor),
        //            myView.widthAnchor.constraint(equalToConstant: 250),
        //            myView.heightAnchor.constraint(equalToConstant: 150)
//        ])
    }

    @objc func onTap() {
        print("Deu tap no botão")
    }
}

