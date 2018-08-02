//
//  movieHeader.swift
//  movie
//
//  Created by Subha on 17/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

protocol MovieHeaderDelegate {
    func currentTabChanged(tab: String)
}

class MovieHeader: UITableViewCell {
    
    var delegate: MovieHeaderDelegate?
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieRatings: UILabel!
    
    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var ticketBar: UIView!
    
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var reviewBar: UIView!
    
    @IBOutlet weak var synopsisButton: UIButton!
    @IBOutlet weak var synopsisBar: UIView!
    
    @IBOutlet weak var songsButton: UIButton!
    @IBOutlet weak var songsBar: UIView!
    
    @IBAction func ticketButtonPressed(_ sender: Any) {

        ticketButton.setTitleColor(UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        ticketBar.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)

        reviewButton.setTitleColor(UIColor.lightGray, for: .normal)
        reviewBar.backgroundColor = UIColor.white

        synopsisButton.setTitleColor(UIColor.lightGray, for: .normal)
        synopsisBar.backgroundColor = UIColor.white

        songsButton.setTitleColor(UIColor.lightGray, for: .normal)
        songsBar.backgroundColor = UIColor.white
        
        delegate?.currentTabChanged(tab: "Ticket")
    }
    
    @IBAction func reviewButtonPressed(_ sender: Any) {
        ticketButton.setTitleColor(UIColor.lightGray, for: .normal)
        ticketBar.backgroundColor = UIColor.white
        
        reviewButton.setTitleColor(UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        reviewBar.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        
        synopsisButton.setTitleColor(UIColor.lightGray, for: .normal)
        synopsisBar.backgroundColor = UIColor.white
        
        songsButton.setTitleColor(UIColor.lightGray, for: .normal)
        songsBar.backgroundColor = UIColor.white
        
        delegate?.currentTabChanged(tab: "Reviews")
        
//        currentTab = "Reviews"
    }
    
    @IBAction func synopsisButtonPressed(_ sender: Any) {
        ticketButton.setTitleColor(UIColor.lightGray, for: .normal)
        ticketBar.backgroundColor = UIColor.white
        
        reviewButton.setTitleColor(UIColor.lightGray, for: .normal)
        reviewBar.backgroundColor = UIColor.white
        
        synopsisButton.setTitleColor(UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        synopsisBar.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        
        songsButton.setTitleColor(UIColor.lightGray, for: .normal)
        songsBar.backgroundColor = UIColor.white
        
        delegate?.currentTabChanged(tab: "Synopsis")
        
//        currentTab = "Synopsis"
    }
    
    @IBAction func songsButtonPressed(_ sender: Any) {
        ticketButton.setTitleColor(UIColor.lightGray, for: .normal)
        ticketBar.backgroundColor = UIColor.white
        
        reviewButton.setTitleColor(UIColor.lightGray, for: .normal)
        reviewBar.backgroundColor = UIColor.white
        
        synopsisButton.setTitleColor(UIColor.lightGray, for: .normal)
        synopsisBar.backgroundColor = UIColor.white
        
        songsButton.setTitleColor(UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        songsBar.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        
        delegate?.currentTabChanged(tab: "Songs")
        
//        currentTab = "Songs"
    }
//    
//    func getCurrentTab() -> String {
//        return currentTab
//    }
}
