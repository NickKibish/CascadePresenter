//
//  CascadeAbstractAnimator.swift
//  Pods
//
//  Created by Nick Kibish on 2/4/17.
//
//

import UIKit

class CascadeAbstractAnimator: NSObject {
    /// Animation parameters. Default values are equal to `CascadeDefaultAnimationPrameters`
    var parameters: CascadeAnimationParameters = CascadeDefaultAnimationPrameters()
}

extension CascadeAbstractAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return parameters.animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.completeTransition(true)
    }
}
