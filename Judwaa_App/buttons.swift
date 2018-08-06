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


class buttons: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! day
        
        return cell
        
    }
    

    @IBOutlet var days: UICollectionView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
       days.register(UINib(nibName: "day", bundle: .main), forCellWithReuseIdentifier: "day")
      // days.backgroundColor=UIColor.black
        days.delegate=self
        days.dataSource=self
     //   var delegate: whichCells?
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}
