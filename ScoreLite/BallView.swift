//
//  BallView.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable class BallView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = frame.size.width/2
        layer.backgroundColor = newSwiftColor.CGColor
        
        layer.borderColor = textFieldColor.CGColor
        layer.borderWidth = 0.5
        
        layer.shadowOpacity = 2.0
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 4.0
        layer.shadowColor = UIColor.whiteColor().CGColor
        
    }
    

    
}