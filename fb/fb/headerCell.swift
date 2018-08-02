//
//  headerCell.swift
//  fb
//
//  Created by Apple on 02/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

protocol whichCells {
    func whichCell(data:Int)
}

class headerCell: UITableViewCell {
    
    
    var c = UIColor()

    var delegate: whichCells?
    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        c=user1.tintColor
        //setting colors for buttons
        
        
        user1.layer.borderColor=c.cgColor
        user1.layer.borderWidth=1
        
        
        friends1.tintColor=UIColor.gray
        friends1.layer.borderColor=friends1.tintColor.cgColor
        friends1.layer.borderWidth=1
        
        
        // Initialization code
    }
    
    @IBAction func user(_ sender: Any) {
        
        delegate?.whichCell(data: 1)
        
        user1.tintColor=c
        user1.layer.borderColor=user1.tintColor.cgColor
        
        
        friends1.tintColor=UIColor.gray
        friends1.layer.borderColor=friends1.tintColor.cgColor
        
    }
    
    @IBAction func friend(_ sender: Any) {
        
        delegate?.whichCell(data: 2)
        user1.tintColor=UIColor.gray
        user1.layer.borderColor=user1.tintColor.cgColor
        
        
        friends1.tintColor=c
        friends1.layer.borderColor=friends1.tintColor.cgColor
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var user1: UIButton!
    @IBOutlet var friends1: UIButton!
    
    
    
    
}
