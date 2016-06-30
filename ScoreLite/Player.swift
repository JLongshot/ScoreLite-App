//
//  Player.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import Foundation
import UIKit

class Player: NSObject, NSCoding {
    
    // PROPERTIES - come back to implement data encapsulation?
    
    //private var _colorArray: [CGColor] = []
    private var _playerName: String!
    private var _ballColor: UIColor!
    var scoreArray = [Int](count: numberOfHoles, repeatedValue: 0)
    private var _totalScore: Int {
       let sum = scoreArray.reduce(0, combine: +)
       return sum
    }
    
    
    var playerName: String {
        return _playerName
    }
    var ballColor: UIColor {
        return _ballColor
    }
    
    var totalScore: Int {
        return _totalScore
    }
    

    
    // Initialization
    
    init (name: String, ball: UIColor) {
        
        _playerName = name
        _ballColor  = ball
        
        print("Player Initialized")
    }
    
    override init() {
        
    }
    
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init()
        self._playerName = aDecoder.decodeObjectForKey("playerName") as? String
        self._ballColor = aDecoder.decodeObjectForKey("ballColor") as? UIColor
        self.scoreArray = (aDecoder.decodeObjectForKey("scoreArray") as? Array)!
        print("Player Decoded")

        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._playerName, forKey: "playerName" )
        aCoder.encodeObject(self._ballColor, forKey: "ballColor")
        aCoder.encodeObject(self.scoreArray, forKey: "scoreArray")

        print("Player Encoded")
    }
}