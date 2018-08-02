//
//  reviewersCell.swift
//  movie
//
//  Created by Subha on 01/08/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class reviewersCell: UICollectionViewCell {
    
    var rating : Float = 4.5

    @IBOutlet weak var superView: UIView!
    
    @IBOutlet weak var reviewerImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet var starImages : [UIImageView]!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewerImage.image = #imageLiteral(resourceName: "anupama_chopra")
        let mask1 = UIImageView(image: #imageLiteral(resourceName: "circle"))
        mask1.frame = reviewerImage.bounds
        reviewerImage.mask = mask1
        
        name.text = "Anupama Chopra"
        
        title.text = "Film Companion Reviewer"
        
    }
    
    func setUpCellElements() {
        for x in 0...4 {
            if rating - Float(x) > 0 {
                starImages[x].image = #imageLiteral(resourceName: "star")
                starImages[x].contentMode = .scaleAspectFit
            
                let mask1 = UIView()
                mask1.backgroundColor = UIColor.blue
                mask1.frame = CGRect(x: 0, y: 0, width: starImages[x].frame.width * CGFloat(rating - Float(x)), height: starImages[x].frame.height)
                starImages[x].mask = mask1
            }
            
            let outline = UIImageView(image: #imageLiteral(resourceName: "starOutline"))
            outline.contentMode = .scaleAspectFit
            ratingView.addSubview(outline)
            outline.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = outline.centerXAnchor.constraint(equalTo: starImages[x].centerXAnchor)
            let verticalConstraint = outline.centerYAnchor.constraint(equalTo: starImages[x].centerYAnchor)
            let widthConstraint = outline.widthAnchor.constraint(equalTo: starImages[x].widthAnchor)
            let heightConstraint = outline.heightAnchor.constraint(equalTo: starImages[x].heightAnchor)
            ratingView.addConstraint(horizontalConstraint)
            ratingView.addConstraint(verticalConstraint)
            ratingView.addConstraint(widthConstraint)
            ratingView.addConstraint(heightConstraint)
        }
        ratingLabel.text = String(rating)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("buttonWorking!!!!!!")
    }
}
