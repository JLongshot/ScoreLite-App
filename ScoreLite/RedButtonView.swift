//
//  GreenButtonView.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable class RedButtonView: UIButton {
  
    
    override func awakeFromNib() {
        layer.cornerRadius = layer.frame.size.height/2
        layer.backgroundColor = newSwiftColor.CGColor
        
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 3.0
        layer.shadowColor = UIColor.blackColor().CGColor
        
    }
    
    

    
    //drop shadow

}
