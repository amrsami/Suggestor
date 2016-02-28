//
//  SuggestionCell.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class SuggestionTypeCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    func configerCell(suggestionType: SuggestionType) {
        nameLbl.text = suggestionType.name
        iconImg.image = suggestionType.icon
    }

}
