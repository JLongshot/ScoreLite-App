//
//  AddPlayersViewController.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Hook up views - Actions and Outlets
    
    @IBOutlet weak var playerNameField: TextField!
    
    @IBOutlet weak var ballColorStack: UIStackView!
    
    //balls
    @IBOutlet weak var redBallOutlet: BallButton!
    @IBOutlet weak var orangeBallOutlet: BallButton!
    @IBOutlet weak var yellowBallOutlet: BallButton!
    @IBOutlet weak var greenBallOutlet: BallButton!
    
    @IBAction func ballColorButton(sender: BallButton) {
        
        let ballButton = sender
        
        deselectAllBalls()
        sender.selectBall()
        selectedBallColor = sender.ballColor!
        
        print("Ball Button Pushed")
        print(ballButton.layer.backgroundColor)
        
    }
    
    
    @IBAction func addPlayerButton(sender: AnyObject) {
        
        if playerNameField.text != "" {
            let playerName = playerNameField.text!
            let ballColor = selectedBallColor
            let newPlayer = Player(name: playerName, ball: ballColor)
            
            DataService.instance.addPlayer(newPlayer)
            tableView.reloadData()
            print("ButtonPushed")
            playerNameField.text = ""
        }

    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // PROPERTIES
    
    var selectedBallColor: UIColor = UIColor.blueColor()
    
    //let selected = ballColorButton.ballSelected
    
    
    
    //  FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        setDefaultBallSelection()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddPlayersViewController.onPlayersLoaded(_:)), name: "playersLoaded", object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPlayersViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let playerIndex = Int(indexPath.row)
            DataService.instance.removePlayer(playerIndex)
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    func onPlayersLoaded(notif: AnyObject) {
        tableView.reloadData()
        print("onPlayersloaded")
    }
    
    func setDefaultBallSelection() {
        redBallOutlet.selectBall()
        selectedBallColor = redBallOutlet.ballColor!
    }
    
    func deselectAllBalls() {
        redBallOutlet.deselectBall()
        orangeBallOutlet.deselectBall()
        yellowBallOutlet.deselectBall()
        greenBallOutlet.deselectBall()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table Delegates and Functions
    
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
            return cell
        } else {
            let cell = PlayerCell()
            cell.configureCell(player)
            return cell
        }
    }

    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell!.contentView.backgroundColor = UIColor(red: 240, green: 70, blue: 70)
    }
    
    
 
    
    
    

}
