//
//  ReviewersTableCell.swift
//  movie
//
//  Created by Subha on 01/08/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ReviewerTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var reviewersCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reviewersCollection.delegate = self
        reviewersCollection.dataSource = self

        reviewersCollection.register(UINib(nibName: "reviewersCell", bundle: Bundle.main), forCellWithReuseIdentifier: "reviewersCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewersCell", for: indexPath) as! reviewersCell
        cell.rating = 0.7 * (Float(indexPath.row)+2)

        cell.superView.layer.cornerRadius = 5
        cell.superView.layer.borderWidth = 1.0
        cell.superView.layer.borderColor = UIColor.clear.cgColor
        cell.superView.layer.masksToBounds = true

        cell.superView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.superView.layer.shadowRadius = 5
        cell.superView.layer.shadowOpacity = 0.2
        cell.superView.layer.masksToBounds = false
        cell.layer.masksToBounds = false
        cell.superView.layer.shadowPath = UIBezierPath(rect: cell.superView.bounds).cgPath
//        cell.contentView.layer.shouldRasterize = true
//        cell.superView.layer.shadowPath = UIBezierPath(roundedRect:cell.superView.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

        cell.setUpCellElements()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsize: CGSize = CGSize(width: 300, height: 180)
        return itemsize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 400
    }
    
}
