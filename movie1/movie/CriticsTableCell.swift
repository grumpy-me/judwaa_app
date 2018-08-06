//
//  CriticsTableCell.swift
//  movie
//
//  Created by Subha on 27/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class CriticsTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var numOfCritic : Int = 12
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CriticsCell", bundle: Bundle.main), forCellWithReuseIdentifier: "criticCell")
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfCritic
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "criticCell", for: indexPath) as! CriticsCell
        cell.mark = Float(indexPath.row + 1)
        cell.updateLabels()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize: CGSize = CGSize(width: 100, height: 140)
        return itemsize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (collectionView.frame.width - 300)/2
    }
    
    func updateHeight(){
        collectionView.heightAnchor.constraint(equalToConstant: CGFloat(150*(numOfCritic/3))).isActive = true
    }
}
