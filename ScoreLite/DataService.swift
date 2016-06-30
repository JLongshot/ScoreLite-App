//
//  DataService.swift
//  ScoreCard
//
//  Created by Jared Long on 5/4/16.
//  Copyright © 2016 Longshot. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private var _loadedPlayers : [Player] = []
    
    let KEY_PLAYERS = "players"
    
    var loadedPlayers: [Player] {
        return _loadedPlayers
    }
    
    

    func savePlayers() {
        let playersData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPlayers)
        NSUserDefaults.standardUserDefaults().setObject(playersData, forKey: KEY_PLAYERS)
        print("savePlayers")
    }

    func loadPlayers() {
        if let playersData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_PLAYERS) as? NSData {
            if let playersArray = NSKeyedUnarchiver.unarchiveObjectWithData(playersData) as? [Player] {
                _loadedPlayers = playersArray
                print("loadPlayers")
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "playersLoaded", object: nil))
        
    }
    
    func addPlayer(player: Player){
        _loadedPlayers.append(player)
        savePlayers()
        loadPlayers()
        print("addPlayers")

    }
    
    func removePlayer(index: Int){
        _loadedPlayers.removeAtIndex(index)
        savePlayers()
        loadPlayers()
        print("removePlayer")
        
    }
    
    func changeScore(playerIndex: Int, holeIndex: Int, newScore: Int){
        _loadedPlayers[playerIndex].scoreArray[holeIndex] = newScore
        print("The 1 Score is \(loadedPlayers[playerIndex].scoreArray[holeIndex])")
        savePlayers()
        loadPlayers()
        print("The 2 Score is \(loadedPlayers[playerIndex].scoreArray[holeIndex])")
    }
    
    func sortByScore() {
        if _loadedPlayers.count > 0 {
            _loadedPlayers.sortInPlace({ $0.totalScore > $1.totalScore })
            savePlayers()
            loadPlayers()
        }


    }
    
    func clearData() {
        
        _loadedPlayers = [Player]()
        
        savePlayers()
        loadPlayers()

        print("game data erased")
    }

    
    

}