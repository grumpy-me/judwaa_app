//
//  CollectionViewCell.swift
//  Judwaa_App
//
//  Created by Apple on 03/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        time1.setTitle("var", for: UIControlState.normal)
        time1.layer.borderWidth=1
        
        
        //put if else according to api
       
        // Initialization code
    }

    
    @IBOutlet var time1: UIButton!
    @IBAction func time(_ sender: Any) {
        
            time1.layer.borderColor=UIColor.green.cgColor
            time1.layer.borderWidth=1
  //          time1.titleLabel?.textColor=UIColor.green
        time1.setTitleColor(UIColor.green, for: .normal)
            print("hiiiii")
        
    }

}
