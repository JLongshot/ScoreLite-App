//
//  HoleViewController.swift
//  ScoreCard
//
//  Created by Jared Long on 5/10/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var strokeCountLabel: UILabel!

    @IBAction func addButton(sender: AnyObject) {
        if DataService.instance.loadedPlayers.count > 0 {
        print("+1")
        var strokeCount = Int(strokeCountLabel.text!)!
        strokeCount = (strokeCount + 1)
        strokeCountLabel.text = "\(strokeCount)"
        //selectedPlayerStrokes = strokeCount
        DataService.instance.changeScore(playerIndex, holeIndex: hole, newScore: strokeCount)
        tableView.reloadData()
        }

    }
    
    @IBAction func subtractButton(sender: AnyObject) {
        if DataService.instance.loadedPlayers.count > 0 {
        print("-1")
        var strokeCount = Int(strokeCountLabel.text!)!
        strokeCount = (strokeCount - 1)
        strokeCountLabel.text = "\(strokeCount)"
        DataService.instance.changeScore(playerIndex, holeIndex: hole, newScore: strokeCount)
        tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "endGame" {
            DataService.instance.sortByScore()
        }
    }
    
    //Properties
    
    var hole = 0
    
    var playerIndex: Int = 0
    
    weak var leader: Player?
    
    //Find Winner
    


    
    //Table
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPlayers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let player = DataService.instance.loadedPlayers[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as? PlayerCell {
            cell.configureCell(player)
            
            if(indexPath.row == playerIndex) {
                cell.contentView.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
                cell.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
            } else {
                cell.contentView.backgroundColor = UIColor.clearColor()
                cell.backgroundColor = UIColor.clearColor()
            }
            
            return cell
        } else {
            let cell = PlayerCell()
            cell.configureCell(player)
            
            if(indexPath.row == playerIndex) {
                cell.contentView.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
                cell.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
            } else {
                cell.contentView.backgroundColor = UIColor.clearColor()
                cell.backgroundColor = UIColor.clearColor()
            }
            
            return cell
        }
        

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        playerIndex = Int(indexPath.row)
        let selectedPlayer = DataService.instance.loadedPlayers[indexPath.row]
        strokeCountLabel.text = "\(selectedPlayer.scoreArray[hole])"
        
       tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell!.contentView.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
    }
    
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
