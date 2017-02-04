//
//  CascadeDismisser.swift
//  Pods
//
//  Created by Nick Kibish on 2/4/17.
//
//

import UIKit

open class CascadeDismisser: CascadeAbstractAnimator {
    override public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let fromSnapshot = fromVC.view.snapshotView(afterScreenUpdates: true) else {
                transitionContext.completeTransition(false)
                return
        }
        
        let containerView = transitionContext.containerView
        var toSnapshot: UIView!
        if let v = containerView.viewWithTag(parameters.viewTag) {
            toSnapshot = v
        } else if let v = toVC.view.snapshotView(afterScreenUpdates: true) {
            toSnapshot = v
        } else {
            transitionContext.completeTransition(false)
            return
        }
        
        toVC.view.removeFromSuperview()
        
        fromSnapshot.frame = fromVC.view.frame
        fromVC.view.removeFromSuperview()
        
        containerView.addSubview(toSnapshot)
        containerView.addSubview(fromSnapshot)
        
        toVC.view.alpha = 1
        toVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        toVC.view.isHidden = true
        
        var finishedFrame = fromSnapshot.frame
        finishedFrame.origin.y = finishedFrame.height
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
            fromSnapshot.frame = finishedFrame
            toSnapshot.alpha = 1
            toSnapshot.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (completed) in
            fromSnapshot.removeFromSuperview()
            toSnapshot.removeFromSuperview()
            
            toVC.view.isHidden = false
            
            transitionContext.completeTransition(completed)
        }
    }
}

