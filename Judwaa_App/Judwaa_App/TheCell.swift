//
//  TheCell.swift
//  Judwaa_App
//
//  Created by Apple on 23/07/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit
import Foundation

class TheCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var int: Int=0
    var yourOtherArray = ["MonkeysRule", "RemoveMe", "SwiftRules", "a","b","c"]
    
    @IBOutlet var hight: NSLayoutConstraint!
    
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
    
    func updatehight()
    {
        int=7
        hight.constant=CGFloat((int / 4 + 1) * 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        int = 7
        return int // whatever according to api
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
  //      cell.frame.size=CGSize(width: 25, height: 15)
        
   //     cell.backgroundColor=UIColor.red
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
    
    @IBOutlet var call: UIButton!
    @IBOutlet var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        call.layer.borderColor=UIColor.green.cgColor
        collection.delegate=self
               collection.dataSource=self
              collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collection.isScrollEnabled=false
        
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell") as! CollectionViewCell
        
        threatre.text="PVR Forum"
        km.text="2.5 km"
        
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
