//
//  SynopsisCell.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

protocol synopsisCellDelegate {
    func reloadCell(row: Int, section: Int)
}

class SynopsisCell: UITableViewCell {
    
    var delegate : synopsisCellDelegate?
    var moreState = "More"
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
            moreButton.setTitle("More", for: .normal)
            descriptionLabel.numberOfLines = 5
            delegate?.reloadCell(row: 0, section: 1)
        }
        else {
            moreButton.setTitle("Less", for: .normal)
            descriptionLabel.numberOfLines = 0
            delegate?.reloadCell(row: 0, section: 1)

        }
    }
}
extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
