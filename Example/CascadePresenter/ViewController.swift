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
    var animationDuration: TimeInterval = 0.5
    var presentingVCAlpha: CGFloat = 0.7
    var presentingTopMargin: CGFloat = 20.5
    var presentedTopMargin: CGFloat  = 28
    var scale: CGFloat = 0.97
    var backgroundColor: UIColor = .black
    var cornerRadius: CGFloat = 5
    var presentedInitialFrame: CGRect?
}

class ViewController: UIViewController {
    @IBOutlet var startView: UIView!
    
    var params = Params()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        params.presentedInitialFrame = startView.frame
    }
    
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
