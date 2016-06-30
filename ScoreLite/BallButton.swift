//
//  BallButton.swift
//  ScoreCard
//
//  Created by Jared Long on 5/7/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit


class BallButton: UIButton {
    
    var ballSelected = false
    
    
    @IBInspectable var ballColor: UIColor? {
        get {
            return UIColor(CGColor: self.layer.backgroundColor!)
        }
        set{
            self.layer.backgroundColor = newValue?.CGColor
        }
    }

    
    override func awakeFromNib() {

        layer.cornerRadius = frame.size.width/2
        layer.borderColor = textFieldColor.CGColor
        layer.borderWidth = 0.5
        layer.masksToBounds = false

        layer.shadowOpacity = 2.0
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 4.0
        layer.shadowColor = UIColor.whiteColor().CGColor

    }
    
    func selectBall() {
        
        if ballSelected == false {
            

        layer.borderWidth = 2
        layer.shadowRadius = 6.0
        ballSelected = true

        } else {
        layer.borderWidth = 0.5
        layer.shadowRadius = 4.0
        ballSelected = false
            
        }
        
    }
    
    func deselectBall() {
        layer.borderWidth = 0.5
        ballSelected = false
    }
    

}
