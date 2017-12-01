//
//  GameViewController.swift
//  Word Game 2
//
//  Created by Elizabeth Hanley on 11/30/17.
//  Copyright (c) 2017 Elizabeth Hanley. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var guesses = [String]()
    var responses = [String]()
    var answer = ""
    var attempts = 0
    var wordBank: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.dataSource = self
        //tableView.delegate = self
       
        generateWordBank()
       
        let randomIndex = Int(arc4random_uniform(UInt32((wordBank?.count)!)))
        answer = wordBank![randomIndex]
        print(answer)
    }
    
    // Generates wordBank array from wordList.txt file
    func generateWordBank () {
        do {
            // This solution assumes  you've got the file in your bundle
            if let path = Bundle.main.path(forResource: "wordlist", ofType: "txt"){
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                wordBank = data.components(separatedBy: "\r\n")
                wordBank?.removeLast()
                // print(wordBank)
            }
        } catch let err as NSError {
            // do something with Error
            print(err)
        }
    }
    
    func check(guess: String) {
        //game logic (Lose, Win, Go Farther, Too Far
        //update attempts counter
        //update table
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = guesses[guesses.count-1-indexPath.row]
        cell.detailTextLabel?.text = responses[responses.count-1-indexPath.row]
        return cell
    }
}




