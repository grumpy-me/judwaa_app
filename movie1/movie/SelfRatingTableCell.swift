//
//  SelfRatingTableCell.swift
//  movie
//
//  Created by Subha on 30/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class SelfRatingTableCell: UITableViewCell {
    
    var rating : Float = 3.5

    @IBOutlet weak var selfImage: UIImageView!
    @IBOutlet weak var selfName: UILabel!
    
    @IBOutlet var ratingStar: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selfImage.backgroundColor = UIColor.cyan
        let mask1 = UIImageView(image: UIImage(named: "circle"))
        mask1.frame = selfImage.bounds
        selfImage.mask = mask1
        let mask2 = UIView()
        mask2.backgroundColor = UIColor.green
        let mask3 = UIView()
        mask3.backgroundColor = UIColor.green

        
        for x in 0...4 {
            
            if(Float(x) < rating) {
                ratingStar[x].image = UIImage(named: "star")
            }
            
            if (rating - Float(x)) < 1.0 && Float(x) < rating {
                mask2.frame = CGRect(x: 0, y: 0, width: ratingStar[x].frame.width * CGFloat(rating - Float(x)), height: ratingStar[x].frame.height)
                ratingStar[x].mask = mask2
            }
            
            let outline = UIImageView(image: UIImage(named: "starOutline"))
            contentView.addSubview(outline)
            outline.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = outline.centerXAnchor.constraint(equalTo: ratingStar[x].centerXAnchor)
            let verticalConstraint = outline.centerYAnchor.constraint(equalTo: ratingStar[x].centerYAnchor)
            let widthConstraint = outline.widthAnchor.constraint(equalTo: ratingStar[x].widthAnchor)
            let heightConstraint = outline.heightAnchor.constraint(equalTo: ratingStar[x].heightAnchor)
            contentView.addConstraint(horizontalConstraint)
            contentView.addConstraint(verticalConstraint)
            contentView.addConstraint(widthConstraint)
            contentView.addConstraint(heightConstraint)

        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
