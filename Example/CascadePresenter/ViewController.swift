//
//  ViewController.swift
//  CascadePresenter
//
//  Created by git on 02/03/2017.
//  Copyright (c) 2017 git. All rights reserved.
//

import UIKit
import CascadePresenter

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .dismiss)
    }
}
