//
//  Constants.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

// MARK: API Constants
let URL_BASE = "https://www.tastekid.com/api/similar?"
let API_KEY = "k=207290-Suggesto-L0JBVQL6"

// MARK: View
let SHADOW_COLOR: CGFloat = 157.0 / 255.0

// MARK: TypeAlias
typealias downloadCompleted = () -> ()

//Enumerations
enum Type: String {
    case Music = "music"
    case Movie = "movies"
    case Show = "shows"
    case Book = "books"
    case Auther = "authers"
    case Game = "games"
}
