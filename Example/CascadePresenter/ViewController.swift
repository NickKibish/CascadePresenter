//
//  ViewController.swift
//  CascadePresenter
//
//  Created by git on 02/03/2017.
//  Copyright (c) 2017 git. All rights reserved.
//

import UIKit
import CascadePresenter

struct Params: CascadeAnimationParameters {
    var animationDuration: TimeInterval = 1.5
    var presentingVCAlpha: CGFloat = 0.97
    var presentingTopMargin: CGFloat = 25
    var presentedTopMargin: CGFloat  = 50
    var scale: CGFloat = 1
    var backgroundColor: UIColor = .green
    var cornerRadius: CGFloat = 15
}

class ViewController: UIViewController {
    let params = Params()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .present, animationParams: params)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .dismiss, animationParams: params)
    }
}
