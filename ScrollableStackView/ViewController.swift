//
//  ViewController.swift
//  ScrollableStackView
//
//  Created by Joan Disho on 13.05.19.
//  Copyright © 2019 Joan Disho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var hStackView: ScrollableStackView = {
        let stackView = ScrollableStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.insets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        stackView.showsHorizontalScrollIndicator = false
        return stackView
    }()

    private lazy var vStackView: ScrollableStackView = {
        let stackView = ScrollableStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.insets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        stackView.showsHorizontalScrollIndicator = false
        return stackView
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 32.0
        return stackView
    }()

    private lazy var roundedViews: [UIView] = {
        return (0...20).map { _ in
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 64.0).isActive = true
            view.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
            view.roundCorners(radius: 32.0)
            return view
        }
    }()

    private lazy var squaredViews: [UIView] = {
        return (0...20).map { i in
            let view = ScrollableStackView()
            view.axis = .vertical
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            var height: CGFloat = 100
            if i % 2 == 0 {
                height = 300
            } else if i % 3 == 0 {
                height = 200
            }
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
            view.roundCorners(radius: 16.0)

            return view
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerStackView)

        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24.0),
                containerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                containerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                containerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                containerStackView.topAnchor.constraint(equalTo: view.topAnchor),
                containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                containerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
        }

        hStackView.stack(roundedViews)
        vStackView.stack(squaredViews)

        containerStackView.addArrangedSubview(hStackView)
        containerStackView.addArrangedSubview(vStackView)
    }
}

