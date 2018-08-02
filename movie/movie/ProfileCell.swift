//
//  ProfileCell.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var celebrityName: UILabel!
    @IBOutlet weak var cekebrityType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        image.layer.cornerRadius = 2
    }
    
    

}
