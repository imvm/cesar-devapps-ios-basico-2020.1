//
//  ViewController.swift
//  DemoPageView
//
//  Created by Ian Manor on 12/04/21.
//

import UIKit

class ViewController: UIViewController {
    private var pages = Page.allCases
    private var currentIndex = 0

    private lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pageController
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Próximo", for: .normal)
        nextButton.backgroundColor = .orange
        nextButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        return nextButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        decoratePageController()
        setupPageController()
        setupButton()
        addInitialPage()
    }

    private func decoratePageController() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [ViewController.self])
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
    }

    private func setupButton() {
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: pageController.view.bottomAnchor, constant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupPageController() {
        pageController.dataSource = self
        pageController.delegate = self
        pageController.view.backgroundColor = .orange
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(pageController)
        view.addSubview(pageController.view)

        NSLayoutConstraint.activate([
            pageController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pageController.view.widthAnchor.constraint(equalToConstant: 200),
            pageController.view.heightAnchor.constraint(equalToConstant: 200)
        ])

        pageController.didMove(toParent: self)
    }

    private func addInitialPage() {
        let initialPage = PageViewController(with: pages[0])
        pageController.setViewControllers([initialPage], direction: .forward, animated: false, completion: nil)
    }

    @objc
    private func goToNextPage() {
        if currentIndex < pages.count - 1 {
            let nextPageViewController = PageViewController(with: pages[currentIndex + 1])
            currentIndex += 1

            pageController.setViewControllers([nextPageViewController], direction: .forward, animated: true)
        } else {
            print("Estamos na última página")
        }
    }
}

extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.page.index,
              index > 0 else {
            return nil
        }

        currentIndex = index - 1

        return PageViewController(with: pages[currentIndex])
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.page.index,
              index < pages.count - 1 else {
            return nil
        }

        currentIndex = index + 1

        return PageViewController(with: pages[currentIndex])
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        currentIndex
    }
}

extension UIView {
    func edgesTo(_ view: UIView) {
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
