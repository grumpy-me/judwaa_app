//
//  ProfileTableCells.swift
//  movie
//
//  Created by Subha on 23/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ProfileTableCells: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var numberOfCelebrity : Int = 0
    
    var profileData: [[String : String]] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProfileCell", bundle: Bundle.main), forCellWithReuseIdentifier: "profileCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCelebrity
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize: CGSize = CGSize(width: 100, height: 160)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfileCell
//        cell.image = UIImageView(image: UIImage(contentsOfFile: profileData[indexPath.row]["artist_image"]!))
        if let url = URL(string: profileData[indexPath.row]["artist_image"]!){
            do {
                let data = try Data(contentsOf: url)
                cell.profileImage.image = UIImage(data: data)
            }catch let err {
                print(err)
            }
        }
//        cell.image.image = UIImage(contentsOfFile: String(profileData[indexPath.row]["artist_image"]!))
        cell.profileName.text = profileData[indexPath.row]["artist_name"]!
        cell.profileType.text = profileData[indexPath.row]["artist_type"]!
        cell.profilePageLink = profileData[indexPath.row]["artist_type"]!
        return cell
    }
}
