//
//  SuggestionResult.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation

class SuggestionResult {
    
    private var _name: String!
    private var _type: String!
    private var _wTeaser: String?
    private var _wUrl: String?
    private var _yID: String?
    private var _results = [SuggestionResult]()
    
    static var instance = SuggestionResult()
    
    var name: String {
        return _name
    }
    
    var type: String {
        return _type
    }
    
    var wTeaser: String? {
        return _wTeaser
    }
    
    var wUrl: String? {
        return _wUrl
    }
    
    var yID: String? {
        return _yID
    }
    
    var results: [SuggestionResult] {
        if _results.isEmpty {
            
        }
        return _results
    }
    
    init() {
        
    }
    
    init(mainDictionary: Dictionary<String, AnyObject>) {
        parseAndIntializeResults(mainDictionary)
    }
    
    init(name: String, type: String, wTeaser: String?, wUrl: String?, yID: String?) {
        _name = name
        _type = type
        _wTeaser = wTeaser
        _wUrl = wUrl
        _yID = yID
    }
    
    func parseAndIntializeResults(mainDictionary: Dictionary<String, AnyObject>) -> [SuggestionResult] {
        _results.removeAll()
        if let similar = mainDictionary["Similar"] as? Dictionary<String,AnyObject> {
            if let resultsArray = similar["Result"] as? [Dictionary<String,String>] {
                for result in resultsArray {
                    if let name = result["Name"], let type = result["Type"], let wTeaser = result["wTeaser"] as String?, let wUrl = result["wUrl"] as String?, let yID = result["yID"] as String? {
                        let suggestionResult = SuggestionResult(name: name, type: type, wTeaser: wTeaser, wUrl: wUrl, yID: yID)
                        self._results.append(suggestionResult)
                    }
                }
            }
        }
        
        return self.results
    }
    
}