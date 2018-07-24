//
//  SynopsisCell.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class SynopsisCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        if moreButton.titleLabel?.text != "More" {
            moreButton.titleLabel?.text = "More"
            descriptionLabel.numberOfLines = 10
        }
        else {
            moreButton.titleLabel?.text = "Less"
            descriptionLabel.numberOfLines = 0
        }
    }
}
