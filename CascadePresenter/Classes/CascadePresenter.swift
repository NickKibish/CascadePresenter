//
//  CascadePresenter.swift
//  Pods
//
//  Created by Nick Kibish on 2/3/17.
//
//

import UIKit

public class CascadePresenter: NSObject {
    /// Animation parameters. Default values are equal to `CascadeDefaultAnimationPrameters`
    public var parameters: CascadeAnimationParameters = CascadeDefaultAnimationPrameters()
}

// MARK: - UIViewControllerAnimatedTransitioning
extension CascadePresenter: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return parameters.animationDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let toSnapshot = toVC.view.snapshotView(afterScreenUpdates: true),
            let fromSnapshot = fromVC.view.snapshotView(afterScreenUpdates: true) else {
                transitionContext.completeTransition(false)
                return
        }
        
        let containerView = transitionContext.containerView
        
        toSnapshot.frame = self.initialFrame
        
        fromSnapshot.transform = CGAffineTransform(scaleX: parameters.scale, y: parameters.scale)
        fromSnapshot.alpha = parameters.presentingVCAlpha
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(toSnapshot)
        
        toVC.view.isHidden = true 
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toSnapshot.frame = self.finalFrame
            fromVC.view.transform = CGAffineTransform(scaleX: self.parameters.scale, y: self.parameters.scale)
            fromVC.view.alpha = self.parameters.presentingVCAlpha
        }) { (completed) in
            fromSnapshot.tag = self.parameters.viewTag
            
            containerView.insertSubview(fromSnapshot, at: 0)
            toSnapshot.removeFromSuperview()
            
            toVC.view.frame = self.finalFrame
            toVC.view.isHidden = false
            
            transitionContext.completeTransition(completed)
        }
    }
}

// MARK: - Private methods
extension CascadePresenter {
    fileprivate var initialFrame: CGRect {
        var frame = UIScreen.main.bounds
        frame.size.height -= parameters.presentedTopMargin
        frame.origin.y = frame.height
        return frame
    }
    
    fileprivate var finalFrame: CGRect {
        var finalFrame = initialFrame
        finalFrame.origin.y = parameters.presentedTopMargin
        return finalFrame
    }
}
