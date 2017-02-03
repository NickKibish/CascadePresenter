//
//  AnimationParameters.swift
//  Pods
//
//  Created by Nick Kibish on 2/3/17.
//
//

import UIKit

/// Protocol provides parametes of prestetion or dismission animation
public protocol AnimationParameters {
    /// Duration of animation.
    var animationDuration: TimeInterval { get set }
    /// Alpha of presenting view controller.
    var presentingVCAlpha: CGFloat { get set }
    /// Lenth from top of presenting view controller to the top of the screen.
    var presentingTopMargin: CGFloat { get set  }
    /// Lenth from top of presented view controller to the top of the screen.
    var presentedTopMargin: CGFloat { get set }
    /// Scale of the presenting view controller.
    var scale: CGFloat { get set }
    /// Background color.
    var backgroundColor: UIColor { get set }
    /// Corner radius of the viewControllers.
    var cornerRadius: CGFloat { get set }
}
