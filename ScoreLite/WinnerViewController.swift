//
//  WinnerViewController.swift
//  ScoreLite
//
//  Created by Jared Long on 6/30/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBAction func terminateGameAction(sender: AnyObject) {
        DataService.instance.clearData()
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    var playerIndex: Int = 0

    
    
    //Table Functions
    
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
       // let selectedPlayer = DataService.instance.loadedPlayers[indexPath.row]
       // strokeCountLabel.text = "\(selectedPlayer.scoreArray[hole])"
        
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
