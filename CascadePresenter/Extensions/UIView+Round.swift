//
//  UIView+Round.swift
//  Pods
//
//  Created by Nick Kibish on 2/4/17.
//
//

import UIKit

extension UIView {
    /// Rounds the given set of corners to the specified radius
    ///
    /// - Parameters:
    ///   - corners: Corners to round
    ///   - radius: Radius to round to
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
