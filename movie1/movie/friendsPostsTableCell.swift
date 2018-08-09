//
//  tableCell.swift
//  fb
//
//  Created by Apple on 01/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

class friendsPostsTableCell: UITableViewCell {
    
    var rating : Float = 2.75
    @IBOutlet var starRating : [UIImageView]!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet var hight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // change hight=0 depending on the api data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellElements() {
        dp.image=UIImage(named: "anupama_chopra")
        name.text = "Anupama Chopra"
        for x in 0...4 {
            
            if(Float(x) < rating) {
                starRating[x].image = UIImage(named: "star")
                starRating[x].contentMode = .scaleAspectFit
            }
            
            if (rating - Float(x)) < 1.0 && Float(x) < rating {
                let mask1 = UIView()
                mask1.backgroundColor = UIColor.blue
                mask1.frame = CGRect(x: 0, y: 0, width: starRating[x].frame.width * CGFloat(rating - Float(x)), height: starRating[x].frame.height)
                starRating[x].mask = mask1
            }
            
            let outline = UIImageView(image: UIImage(named: "starOutline"))
            outline.contentMode = .scaleAspectFit
            contentView.addSubview(outline)
            outline.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = outline.centerXAnchor.constraint(equalTo: starRating[x].centerXAnchor)
            let verticalConstraint = outline.centerYAnchor.constraint(equalTo: starRating[x].centerYAnchor)
            let widthConstraint = outline.widthAnchor.constraint(equalTo: starRating[x].widthAnchor)
            let heightConstraint = outline.heightAnchor.constraint(equalTo: starRating[x].heightAnchor)
            contentView.addConstraint(horizontalConstraint)
            contentView.addConstraint(verticalConstraint)
            contentView.addConstraint(widthConstraint)
            contentView.addConstraint(heightConstraint)
            
        }
        ratingLabel.text = String(rating)
        
    }
    @IBOutlet var dp: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var review: UILabel!
    @IBOutlet var reactions: UIView!
    @IBAction func like(_ sender: Any) {
    }
    
    @IBAction func comment(_ sender: Any) {
        
        //segue i guess
    }
    
    @IBAction func share(_ sender: Any) {
    }
    
}
