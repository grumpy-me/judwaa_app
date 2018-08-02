//
//  TheCell.swift
//  Judwaa_App
//
//  Created by Apple on 23/07/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit
import Foundation

class TheCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var yourOtherArray = ["MonkeysRule", "RemoveMe", "SwiftRules", "a","b","c"]
    
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//
//        collection.delegate=self
//        collection.dataSource=self
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3  // whatever according to api
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor=UIColor.red
     //   how to put text in the cell??
        
        
          // change accordingly
        // Initialization code
        
        return cell
    
    }
    
    @IBOutlet var threatre: UILabel!
    @IBOutlet var km: UILabel!
    @IBAction func call(_ sender: Any) {
        
        // perform call function
        
    }
    
    @IBOutlet var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collection.delegate=self
               collection.dataSource=self
              collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        threatre.text="PVR Forum"
        km.text="2.5 km"
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
