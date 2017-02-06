//
//  CascadeDefaultAnimationPrameters.swift
//  Pods
//
//  Created by Nick Kibish on 2/3/17.
//
//

import Foundation

/// Default Animation Parameters
struct CascadeDefaultAnimationPrameters: CascadeAnimationParameters {
    /// Provide it if you want use specific start frame instead of frame in the bottom of the screen
    var presentedInitialFrame: CGRect? = nil 
    /// = 0.5
    var animationDuration: TimeInterval = 0.5
    /// = 0.7
    var presentingVCAlpha: CGFloat = 0.7
    /// = 20.5
    var presentingTopMargin: CGFloat = 20.5
    /// = 28.0
    var presentedTopMargin: CGFloat  = 28
    /// = 0.96
    var scale: CGFloat = 0.96
    /// = .black
    var backgroundColor: UIColor = UIColor.black
    /// = 5
    var cornerRadius: CGFloat = 5
}
