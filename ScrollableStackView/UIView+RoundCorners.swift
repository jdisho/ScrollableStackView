//
//  UIView+RoundCorners.swift
//  ScrollableStackView
//
//  Created by Joan Disho on 18.05.19.
//  Copyright © 2019 Joan Disho. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner = .allCorners, radius: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            let path = UIBezierPath(
                roundedRect: self.bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
