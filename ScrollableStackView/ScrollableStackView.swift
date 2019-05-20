//
//  ScrollableStackView.swift
//  ScrollableStackView
//
//  Created by Joan Disho on 13.05.19.
//  Copyright © 2019 Joan Disho. All rights reserved.
//

import UIKit

class ScrollableStackView: UIScrollView {

    var axis: NSLayoutConstraint.Axis = .horizontal {
        didSet {
            stackView.axis = axis
            stackViewWidthConstraint.isActive = (axis == .vertical)
            stackViewHeightConstraint.isActive = (axis == .horizontal)
        }
    }

    var alignment: UIStackView.Alignment = .fill {
        didSet {
            stackView.alignment = alignment
        }
    }

    var distribution: UIStackView.Distribution = .fill {
        didSet {
            stackView.distribution = distribution
        }
    }

    var spacing: CGFloat = 0.0 {
        didSet {
            stackView.spacing = spacing
        }
    }

    var insets: UIEdgeInsets = .zero {
        didSet {
            stackView.layoutMargins = insets
            stackView.isLayoutMarginsRelativeArrangement = true
        }
    }

    var arrangedSubviews: [UIView] {
        return stackView.arrangedSubviews
    }

    private let stackView = UIStackView()
    private var stackViewWidthConstraint = NSLayoutConstraint()
    private var stackViewHeightConstraint = NSLayoutConstraint()

    init(arrangedSubviews: [UIView]) {
        super.init(frame: .zero)

        addArrangedSubviews(arrangedSubviews)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        configureStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }

    func removeArrangedSubview(_ view: UIView) {
        stackView.removeArrangedSubview(view)
    }

    func removeArrangedSubviews(_ views: [UIView]) {
        views.forEach { removeArrangedSubview($0) }
    }

    func insertArrangedSubview(_ view: UIView, at stackIndex: Int) {
        stackView.insertArrangedSubview(view, at: stackIndex)
    }

    private func configureStackView() {
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing

        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])

        stackViewWidthConstraint = stackView.widthAnchor.constraint(equalTo: widthAnchor)
        stackViewHeightConstraint = stackView.heightAnchor.constraint(equalTo: heightAnchor)

        stackViewWidthConstraint.isActive = (axis == .vertical)
        stackViewHeightConstraint.isActive = (axis == .horizontal)
    }
}
