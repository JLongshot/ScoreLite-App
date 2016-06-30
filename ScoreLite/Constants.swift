//
//  Constants.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import Foundation
import UIKit


//Theme Colors



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

let newSwiftColor = UIColor(red: 127, green: 42, blue: 42)
let textFieldColor = UIColor(red: 225, green: 225, blue: 225)

let gradientBGone = UIColor(red: 210, green: 54, blue: 54)
let gradientBGtwo = UIColor(red: 234, green: 78, blue: 78)


let redUIColor = UIColor(red: 100, green: 10, blue: 10)
let orangeUIColor = UIColor(red: 100, green: 50, blue: 10)
let yellowUIColor = UIColor(red: 100, green: 80, blue: 10)




//Ball Colors



//Constants
var numberOfHoles = 18


// Operators
func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.totalScore == rhs.totalScore
}

func <(lhs: Player, rhs: Player) -> Bool {
    return lhs.totalScore < rhs.totalScore
}
