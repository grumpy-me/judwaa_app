//
//  buttons.swift
//  Judwaa_App
//
//  Created by Apple on 24/07/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

protocol whichCells{
    
    func whichCell(data: Int)
}

class buttons: UITableViewCell {

    var delegate: whichCells?
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var one1: UIButton!
    @IBOutlet var one2: UIButton!
    
    @IBAction func one(_ sender: Any) {
        
        delegate?.whichCell(data: 1)
        one1.backgroundColor=UIColor.green
        
        
      //  print("1")
        
    }
    
    @IBAction func two(_ sender: Any) {
        
        delegate?.whichCell(data: 2)
        one2.backgroundColor=UIColor.green
        
        
    }
    
}
