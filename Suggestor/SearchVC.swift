//
//  SearchVC.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit
import Material

class SearchVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var typeIconImg: RoundedUIImageView!
    @IBOutlet weak var textField: MaterialTextField!
    @IBOutlet weak var tableView: UITableView!
    
    var results = [Suggestion]()
    
    var type: Type = .Movie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        changeType()
    }
    
    func changeType() {
        switch type {
        case .Movie:
            typeIconImg.image = UIImage(named: "Movie")
        case .Music:
            typeIconImg.image = UIImage(named: "Music")
        case .Show:
            typeIconImg.image = UIImage(named: "Show")
        case .Auther:
            typeIconImg.image = UIImage(named: "Auther")
        case .Book:
            typeIconImg.image = UIImage(named: "Book")
        case .Game:
            typeIconImg.image = UIImage(named: "Game")
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let result = results[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("SuggestionCell") as? SuggestionCell {
            cell.configerCell(result)
            return cell
        } else {
            return SuggestionCell()
        }
    }
    
    @IBAction func onSearchBtnPressed(sender: AnyObject) {
        search()
    }
    
    func search() {
        if let quary = textField.text where textField.text != "" {
            let suggestion = Suggestion(quary: quary, type: type, info: .WithInfo)
            suggestion.downloadSugesstion { () -> () in
                self.results = suggestion.results
                print(self.results)
                self.tableView.reloadData()
            }
        } else {
            //TODO: Print Erorr
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        search()
        return true
    }
    
}
