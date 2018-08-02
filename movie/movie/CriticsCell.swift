//
//  CriticsCell.swift
//  movie
//
//  Created by Subha on 27/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class CriticsCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var mark: Float = 7.5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func updateLabels(){
        rating.text = String(mark) + " / 10"
    }

}
