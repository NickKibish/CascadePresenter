//
//  AnimationParameters.swift
//  Pods
//
//  Created by Nick Kibish on 2/3/17.
//
//

import Foundation

/// Protocol provides parametes of prestetion or dismission animation
public protocol CascadeAnimationParameters {
    /// Duration of animation.
    var animationDuration: TimeInterval { get }
    /// Alpha of presenting view controller.
    var presentingVCAlpha: CGFloat { get }
    /// Lenth from top of presenting view controller to the top of the screen.
    var presentingTopMargin: CGFloat { get  }
    /// Lenth from top of presented view controller to the top of the screen.
    var presentedTopMargin: CGFloat { get }
    /// Scale of the presenting view controller.
    var scale: CGFloat { get }
    /// Background color.
    var backgroundColor: UIColor { get }
    /// Corner radius of the viewControllers.
    var cornerRadius: CGFloat { get }
    /// Provide it if you want use specific start frame instead of frame in the bottom of the screen
    var presentedInitialFrame: CGRect? { get }
}

internal extension CascadeAnimationParameters {
    var viewTag: Int {
        return 101
    }
}
