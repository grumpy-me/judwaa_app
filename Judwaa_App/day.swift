//
//  day.swift
//  Judwaa_App
//
//  Created by Apple on 03/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

protocol displayCells {
    
    func display(variable: Int)
    
}

class day: UICollectionViewCell {
    
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        day.layer.borderWidth=1
    
        
        
    }
    @IBOutlet var day: UILabel!
    @IBOutlet var date: UILabel!
    
    
    @IBAction func dayPressed(_ sender: Any) {
        
        
        
    }
    
}
