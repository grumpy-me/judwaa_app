//
//  ProfileCell.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {


    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileType: UILabel!
    var profilePageLink = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = 2
        profileImage.contentMode = .scaleAspectFit
    }
    
    

}
