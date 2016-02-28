//
//  RoundedUIImageView.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class RoundedUIImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }
}
