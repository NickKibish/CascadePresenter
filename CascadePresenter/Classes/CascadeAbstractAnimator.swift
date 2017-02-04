//
//  CascadeAbstractAnimator.swift
//  Pods
//
//  Created by Nick Kibish on 2/4/17.
//
//

import UIKit

open class CascadeAbstractAnimator: NSObject {
    /// Animation parameters. Default values are equal to `CascadeDefaultAnimationPrameters`
    public var parameters: CascadeAnimationParameters = CascadeDefaultAnimationPrameters()
}

extension CascadeAbstractAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return parameters.animationDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.completeTransition(true)
    }
}
