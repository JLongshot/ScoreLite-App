//
//  scoreButtons.swift
//  ScoreCard
//
//  Created by Jared Long on 6/16/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable

class ScoreButtons: UIButton {
    
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        newSwiftColor.setFill()
        path.fill()
    }
    
}
