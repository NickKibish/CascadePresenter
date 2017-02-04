//
//  CascadePresenter.swift
//  Pods
//
//  Created by Nick Kibish on 2/3/17.
//
//

import UIKit

class CascadePresenter: CascadeAbstractAnimator {
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let toSnapshot = toVC.view.snapshotView(afterScreenUpdates: true),
            let fromSnapshot = fromVC.view.snapshotView(afterScreenUpdates: true) else {
                transitionContext.completeTransition(false)
                return
        }
        
        let containerView = transitionContext.containerView
        
        toSnapshot.frame = self.initialFrame
        
        setupFromSnapshot(fromSnapshot: fromSnapshot)
        updateFromVCFrame(from: fromSnapshot)
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(toSnapshot)
        
        toVC.view.frame = self.finalFrame
        toVC.view.round(corners: [.topLeft, .topRight], radius: parameters.cornerRadius)
        toVC.view.isHidden = true
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toSnapshot.frame = self.finalFrame
            toSnapshot.round(corners: [.topLeft, .topRight], radius: self.parameters.cornerRadius)
            
            fromVC.view.transform = CGAffineTransform(scaleX: self.parameters.scale, y: self.parameters.scale)
            fromVC.view.alpha = self.parameters.presentingVCAlpha
            fromVC.view.layer.cornerRadius = self.parameters.cornerRadius
            self.updateFromVCFrame(from: fromVC.view)
        }) { (completed) in
            containerView.insertSubview(fromSnapshot, at: 0)
            toSnapshot.removeFromSuperview()
            
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
        frame.origin.y = UIScreen.main.bounds.height
        return frame
    }
    
    fileprivate var finalFrame: CGRect {
        var finalFrame = initialFrame
        finalFrame.origin.y = parameters.presentedTopMargin
        return finalFrame
    }
    
    fileprivate func updateFromVCFrame(from: UIView) {
        var frame = from.frame
        frame.origin.y = parameters.presentingTopMargin
        from.frame = frame
    }
    
    fileprivate func setupFromSnapshot(fromSnapshot: UIView) {
        fromSnapshot.transform = CGAffineTransform(scaleX: parameters.scale, y: parameters.scale)
        fromSnapshot.alpha = parameters.presentingVCAlpha
        fromSnapshot.layer.cornerRadius = parameters.cornerRadius
        fromSnapshot.layer.masksToBounds = true
        fromSnapshot.tag = parameters.viewTag
    }
}
