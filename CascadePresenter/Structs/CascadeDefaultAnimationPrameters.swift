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
    public var animationDuration: TimeInterval = 0.1
    public var presentingVCAlpha: CGFloat = 0
    public var presentingTopMargin: CGFloat = 0
    public var presentedTopMargin: CGFloat  = 0
    public var scale: CGFloat = 0
    public var backgroundColor: UIColor = UIColor.black
    public var cornerRadius: CGFloat = 0
}
