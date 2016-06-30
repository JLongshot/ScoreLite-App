//
//  GeneralUIButton.swift
//  ScoreCard
//
//  Created by Jared Long on 5/12/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

class GeneralUIButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.cornerRadius = frame.size.height/2
        
        
       // let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        layer.shadowRadius = 8.0
        layer.shadowColor = UIColor.blackColor().CGColor
        
    }
        
}
