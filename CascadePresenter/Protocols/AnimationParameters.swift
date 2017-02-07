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

/// Defauls Values
public extension CascadeAnimationParameters {
    /// = 5
    var animationDuration: TimeInterval {
        return 5
    }
    
    /// = 0.7
    var presentingVCAlpha: CGFloat {
        return 0.7
    }
    
    /// = 21.5
    var presentingTopMargin: CGFloat {
        return 21.5
    }
    
    /// = 27
    var presentedTopMargin: CGFloat {
        return 27
    }
    
    /// = 0.9
    var scale: CGFloat {
        return 0.9
    }
    
    /// = .black
    var backgroundColor: UIColor {
        return .black
    }
    
    /// = 5
    var cornerRadius: CGFloat {
        return 5
    }
    
    /// = nil 
    var presentedInitialFrame: CGRect? {
        return nil 
    }
}

internal extension CascadeAnimationParameters {
    var viewTag: Int {
        return 101
    }
}
