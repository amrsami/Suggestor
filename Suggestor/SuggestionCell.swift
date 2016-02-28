//
//  SuggestionCell.swift
//  Suggestor
//
//  Created by Amr Sami on 2/22/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class SuggestionCell: UITableViewCell, UIWebViewDelegate {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var wUrlLbl: UILabel!
    @IBOutlet weak var youtubePlayerWebView: UIWebView!
    
    var iframe = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        youtubePlayerWebView.delegate = self
    }
    
    func configerCell(suggestion: Suggestion) {
        nameLbl.text = suggestion.name
        typeLbl.text = suggestion.type
        wUrlLbl.text = suggestion.wUrl
        iframe = "<div class=\"container\"><iframe class=\"video\" src=\"https://www.youtube.com/embed/\(suggestion.yID!)\"frameborder=\"0\" allowfullscreen\"></iframe></div>"
        print(iframe)
        youtubePlayerWebView.loadHTMLString(iframe, baseURL: nil)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let css = ".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%;} .video {position: absolute; top: 0; left: 0; width: 100%; height: 100%;}"
        let js = String(format: "var styleNode = document.createElement('style');\nstyleNode.type = \"text/css\";\nvar styleText = document.createTextNode('%@');\nstyleNode.appendChild(styleText);\ndocument.getElementsByTagName('head')[0].appendChild(styleNode);\n", css)
        youtubePlayerWebView.stringByEvaluatingJavaScriptFromString(js)
    }

}
