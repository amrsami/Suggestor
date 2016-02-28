//
//  SuggestionType.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class SuggestionType {
    private var _name: String!
    private var _icon: UIImage!
    private var _type: Type!
    
    var name: String {
        return _name
    }
    
    var icon: UIImage {
        return _icon
    }
    
    var type: Type {
        return _type
    }
    
    init(name: String, type: Type) {
        _name = name
        _icon = UIImage(named: name)
        _type = type
    }
}