//
//  Cascade.swift
//  Pods
//
//  Created by Nick Kibish on 2/5/17.
//
//

import Foundation

/// Type of animation
///
/// - present: use it in presenting method of UIViewControllerTransitioningDelegate
/// - dismiss: use it in dismissing method of UIViewControllerTransitioningDelegate
public enum CascadeAnimationType {
    case present, dismiss
}

/// This is Abstract factory for creating correct UIViewControllerAnimatedTransitioning instance
public enum Cascade {
    /// It creates correct animator
    ///
    /// - Parameter type: type of animation: .present or .dismiss
    /// - Parameter animationParams: parameters of animation. 
    /// By default it has next values`:`
    ///     animationDuration = 0.5;
    ///     presentingVCAlpha = 0.7;
    ///     presentingTopMargin = 20.5;
    ///     presentedTopMargin  = 28;
    ///     scale = 0.96;
    ///     backgroundColor = UIColor.black;
    ///     cornerRadius = 5;
    /// - Returns: Correct instance of UIViewControllerAnimatedTransitioning
    public static func animator(for type: CascadeAnimationType, animationParams: CascadeAnimationParameters = CascadeDefaultAnimationPrameters()) -> UIViewControllerAnimatedTransitioning {
        var animator: CascadeAbstractAnimator!
        switch type {
        case .present:
            animator = CascadePresenter()
            break
        case .dismiss:
            animator = CascadeDismisser()
        }
        
        animator.parameters = animationParams
        return animator
    }
}
