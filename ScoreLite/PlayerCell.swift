//
//  PlayerCell.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

@IBDesignable
class PlayerCell: UITableViewCell {
    
    //play name label
    //player ball outlet
    
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func configureCell(player: Player) {
       
        playerNameLabel.text = player.playerName
        scoreLabel.text = "\(player.totalScore)"
        
        print("cellconfigured")
        
        ballView.layer.backgroundColor = player.ballColor.CGColor
    }
    

}
