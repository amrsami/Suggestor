//
//  Suggestion.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import Alamofire

class Suggestion {
    private var _type: String?
    private var _info: Int?
    private var _limit: Int?
    private var _url: String!
    private var suggestionResult: SuggestionResult!
    private var _resultName: String!
    private var _resultType: String!
    private var _resultWTeaser: String?
    private var _resultWUrl: String?
    private var _resultYID: String?
    private var _results = [Suggestion]()
    
    static var instance = Suggestion()
    
    var name: String {
        return _resultName
    }
    
    var type: String {
        return _resultType
    }
    
    var wTeaser: String? {
        return _resultWTeaser
    }
    
    var wUrl: String? {
        return _resultWUrl
    }
    
    var yID: String? {
        return _resultYID
    }
    
    var results: [Suggestion] {
        return _results
    }
    
    init() {
        
    }
    
    init(name: String, type: String, wTeaser: String?, wUrl: String?, yID: String?) {
        _resultName = name
        _resultType = type
        _resultWTeaser = wTeaser
        _resultWUrl = wUrl
        _resultYID = yID
    }
    
    enum Info: Int {
        case WithInfo = 1
        case WithoutInfo = 0
    }
    
    
    init(quary: String) {
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&info=1"
    }
    
    init(quary: String, type: Type) {
        _type = type.rawValue
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_type!)"
    }
    
    init(quary: String, info: Info) {
        _info = info.rawValue
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_info)"
    }
    init(quary: String, limit: Int) {
        _limit = limit
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_limit)"
    }
    
    init(quary: String, type: Type, info: Info) {
        _type = "type=\(type.rawValue)"
        _info = info.rawValue
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_type!)&info=\(_info!)"
    }
    
    init(quary: String, type: Type, limit: Int) {
        _type = type.rawValue
        _limit = limit
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_type)&\(_limit)"
    }
    
    init(quary: String, type: Type, info: Info, limit: Int) {
        _type = type.rawValue
        _info = info.rawValue
        _limit = limit
        _url = "\(URL_BASE)q=\(quary)&\(API_KEY)&\(_type)&\(_info)&\(_limit)"
    }
    
    func downloadSugesstion(completed: downloadCompleted) {
        _results.removeAll()
        Alamofire.request(.GET, NSURL(string: _url)!).responseJSON { response in
            if let mainDictionary = response.result.value as? Dictionary<String, AnyObject> {
                if let similar = mainDictionary["Similar"] as? Dictionary<String,AnyObject> {
                    if let resultsArray = similar["Results"] as? [Dictionary<String,String>] {
                        for result in resultsArray {
                            if let name = result["Name"], let type = result["Type"], let wTeaser = result["wTeaser"] as String?, let wUrl = result["wUrl"] as String?, let yID = result["yID"] as String? {
                                let suggestionResult = Suggestion(name: name, type: type, wTeaser: wTeaser, wUrl: wUrl, yID: yID)
                                self._results.append(suggestionResult)
                                
                            }
                        }
                        
                    }
                    
                }
                print(mainDictionary)
                print(self._url)
            }
            print(self._results)
            completed()
        }
        
    }
    
}