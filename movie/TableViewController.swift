//
//  TableViewController.swift
//  movie
//
//  Created by Subha on 13/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, MovieHeaderDelegate {
   
    var currentTab:String = "Ticket"
    
    var numberOfSections : Int = 1
    
    var numberOfRowsInSections : [Int] = [1,1]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerNib = UINib.init(nibName: "movieHeader", bundle: Bundle.main)
        
        tableView.register(headerNib, forCellReuseIdentifier: "MovieHeader")
        
        tableView.register(UINib(nibName: "SongsCells", bundle: Bundle.main), forCellReuseIdentifier: "songsCell")
        tableView.register(UINib(nibName: "ProfileTableCells", bundle: Bundle.main), forCellReuseIdentifier: "profileTableCell")
        
        updateNumberOfRowsAndSections()
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print(section)
        return numberOfRowsInSections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentTab == "Ticket" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                
                cell.delegate = self
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongsCells
                
                cell.backgroundColor = UIColor.white
                tableView.rowHeight = UITableViewAutomaticDimension
                return cell
            default:
                return UITableViewCell()
            }
        }
        if currentTab == "Synopsis" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableCells
                
                cell.contentView.clipsToBounds = true
//                tableView.rowHeight = UITableViewAutomaticDimension
                return cell
            default:
                return UITableViewCell()
            }
        }
        else {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                return cell
            default:
                return UITableViewCell()
            }
        }
    }

    func updateNumberOfRowsAndSections() {
        switch currentTab {
        case "Ticket":
            numberOfSections = 2
        case "Reviews":
            numberOfSections = 5
        case "Synopsis":
            numberOfSections = 4
        case "Songs":
            numberOfSections = 2
        default:
            numberOfSections = 1
        }
        
//        numberOfRowsInSections = []
        
        for i in 1...numberOfSections {
            // find number of rows in i'th section and append it numberOfRowsInSection
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func currentTabChanged(tab: String) {
        currentTab = tab
        print(currentTab)
        tableView.reloadData()
    }
    
    
}
