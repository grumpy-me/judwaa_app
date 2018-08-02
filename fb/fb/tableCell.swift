//
//  tableCell.swift
//  fb
//
//  Created by Apple on 01/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {
    
    

   
    @IBOutlet var hight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // change hight=0 depending on the api data
        
       
        print(reactions.frame)
     //   reactions.backgroundColor=UIColor.red
       
        
        dp.image=#imageLiteral(resourceName: "anupama_chopra")
        rating.image=#imageLiteral(resourceName: "anupama_chopra")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var dp: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var rating: UIImageView!
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
