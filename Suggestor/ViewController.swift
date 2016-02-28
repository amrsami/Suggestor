//
//  ViewController.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let suggestionTyps: [SuggestionType] = [SuggestionType(name: "Movie", type: .Movie), SuggestionType(name: "Music", type: .Music), SuggestionType(name: "Book", type: .Book), SuggestionType(name: "Auther", type: .Auther), SuggestionType(name: "Show", type: .Show), SuggestionType(name: "Game", type: .Game)]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionTyps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let type = suggestionTyps[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("SuggetionTypeCell") as? SuggestionTypeCell {
            cell.configerCell(type)
            return cell
        } else {
            return SuggestionTypeCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let suggestionTyp = suggestionTyps[indexPath.row]
        self.performSegueWithIdentifier("SearchVC", sender: suggestionTyp)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let suggestionType = sender as? SuggestionType {
            if let destinationVC = segue.destinationViewController as? SearchVC {
                destinationVC.type = suggestionType.type
            }

        }
    }
    
}