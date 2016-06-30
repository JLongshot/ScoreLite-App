//
//  RoundedTextField.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    //Button Color
    
    
    //rounded corners
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        layer.backgroundColor = textFieldColor.CGColor
        layer.borderColor = UIColor.clearColor().CGColor

        
        
    }
    
    
    
    
    //drop shadow
    
}
