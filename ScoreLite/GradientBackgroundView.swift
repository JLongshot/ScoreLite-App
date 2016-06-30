//
//  GradientBackgroundView.swift
//  ScoreCard
//
//  Created by Jared Long on 5/5/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable
class GradientBackground: UIView {
    
    let gradientLayer = CAGradientLayer()
    

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // gradient layer for cell
        gradientLayer.frame = bounds
        let color1 = UIColor(red: 240, green: 70, blue: 70).CGColor as CGColorRef
        let color2 = UIColor(red: 210, green: 54, blue: 54).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        layer.insertSublayer(gradientLayer, atIndex: 0)
        
        
        
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    
    
    
}
