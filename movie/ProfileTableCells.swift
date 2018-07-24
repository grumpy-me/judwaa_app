//
//  ProfileTableCells.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ProfileTableCells: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var numberOfCelebrity : Int = 3
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProfileCell", bundle: Bundle.main), forCellWithReuseIdentifier: "profileCell")
        print("its here")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(numberOfCelebrity)
        print("numOfItems")
        return numberOfCelebrity
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize: CGSize = CGSize(width: 100, height: 140)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfileCell
        print("hi")
        print("collection view: " + String(indexPath.row))
        
        return cell
    }
}
