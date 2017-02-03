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
    /// = 0.5
    var animationDuration: TimeInterval = 0.5
    /// = 0.7
    var presentingVCAlpha: CGFloat = 0.7
    /// = 20.0
    var presentingTopMargin: CGFloat = 20
    /// = 40.0
    var presentedTopMargin: CGFloat  = 40
    /// = 0.9
    var scale: CGFloat = 0.9
    /// = .black
    var backgroundColor: UIColor = UIColor.black
    /// = 0
    var cornerRadius: CGFloat = 0
}
