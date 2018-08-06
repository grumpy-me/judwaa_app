//
//  TableViewController.swift
//  movie
//
//  Created by Subha on 13/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MovieHeaderDelegate, synopsisCellDelegate {
   
    @IBOutlet weak var mainTableBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var ticketTabFooter: UIView!
    
    @IBOutlet weak var mainTable: UITableView!
    var id : Int = 1
    var currentTab:String = "Ticket"
    
    var numberOfSections : Int = 1
    
    var numberOfRowsInSectionsssss : [Int] = [1,1,1,1,3,1,1,1,1,1,1,1,1,1]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering all kinds of cells
        
        let headerNib = UINib.init(nibName: "movieHeader", bundle: Bundle.main)
        mainTable.register(headerNib, forCellReuseIdentifier: "MovieHeader")
        mainTable.register(UINib(nibName: "SongsCells", bundle: Bundle.main), forCellReuseIdentifier: "songsCell")
        mainTable.register(UINib(nibName: "ProfileTableCells", bundle: Bundle.main), forCellReuseIdentifier: "profileTableCell")
        mainTable.register(UINib(nibName: "CriticsTableCell", bundle: Bundle.main), forCellReuseIdentifier: "criticTableCell")
        mainTable.register(UINib(nibName: "SynopsisCell", bundle: Bundle.main), forCellReuseIdentifier: "synopsisCell")
        mainTable.register(UINib(nibName: "SelfRatingTableCell", bundle: Bundle.main), forCellReuseIdentifier: "selfRatingTableCell")
        mainTable.register(UINib(nibName: "ReviewersTableCell", bundle: Bundle.main), forCellReuseIdentifier: "reviewerTableCell")
        mainTable.register(UINib(nibName: "friendsPostsHeaderCell", bundle: Bundle.main), forCellReuseIdentifier: "friendsPostsHeaderCell")
        mainTable.register(UINib(nibName: "friendsPostsTableCell", bundle: Bundle.main), forCellReuseIdentifier: "friendsPostsTableCell")
        mainTable.register(UINib(nibName:"TheCell" , bundle: .main), forCellReuseIdentifier: "TheCell")
        mainTable.register(UINib(nibName:"buttons" , bundle: .main), forCellReuseIdentifier: "buttons")

        mainTable.rowHeight = UITableViewAutomaticDimension
        
        updateNumberOfRowsAndSections()
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentTab == "Ticket" {
            if(section == 1) {
                return 6
            }
        }
        // #warning Incomplete implementation, return the number of rows
//        print(section)
        return numberOfRowsInSectionsssss[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentTab == "Ticket" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                
                cell.delegate = self
                
                return cell
            case 1:
                if indexPath.row==0{
                    
                    let cell=tableView.dequeueReusableCell(withIdentifier: "buttons", for: indexPath) as! buttons
                    // this is where set the delegate to self, where the item is created
                    //   cell.delegate=self
                    return cell
                    
                }
                    
                else{
                    
                    if id==1 {
                        
                        let
                        cell=tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! TheCell
                        
                        
                        return cell
                    }
                        
                    else
                    {
                        let cell=tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! TheCell
                        cell.updatehight()
                        return cell
                    }
                }
            default:
                return UITableViewCell()
            }
        }
        if currentTab == "Reviews" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                
                cell.delegate = self
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "criticTableCell", for: indexPath) as! CriticsTableCell
                cell.numOfCritic = 3
                cell.updateHeight()
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "selfRatingTableCell", for: indexPath) as! SelfRatingTableCell
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "reviewerTableCell", for: indexPath) as! ReviewerTableCell
                print(indexPath.row)
                return cell
            case 4:
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "friendsPostsHeaderCell", for: indexPath) as! friendsPostsHeaderCell
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "friendsPostsTableCell", for: indexPath) as! friendsPostsTableCell
                    cell.rating = 3.75
                    cell.setUpCellElements()
                    return cell
                }
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisCell", for: indexPath) as! SynopsisCell
                cell.delegate = self
                cell.frame.size.height = cell.descriptionLabel.frame.size.height + cell.moreButton.frame.size.height
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableCells
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableCells
                return cell
            default:
                return UITableViewCell()
            }
        }
        if currentTab == "Songs" {
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if currentTab == "Synopsis" && section > 0 {
            return 25
        }else{
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if currentTab == "Synopsis" && section > 0 {
            let header = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
            let label = UILabel(frame: CGRect(x: 30, y: 5, width: 100, height: 20))
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textAlignment = NSTextAlignment.left
            switch section {
            case 1:
                label.text = "Synopsis"
            case 2:
                label.text = "Cast"
            case 3:
                label.text = "Crew"
            default:
                label.text = "Synopsis"
            }
            header.addSubview(label)
            return header
        }

        return nil
    }
    

    func updateNumberOfRowsAndSections() {
        switch currentTab {
        case "Ticket":
            numberOfSections = 2
        case "Reviews":
            numberOfSections = 5
        case "Synopsis":
            numberOfSections = 8
        case "Songs":
            numberOfSections = 2
        default:
            numberOfSections = 1
        }
    }
    
    func reloadCell(row: Int, section: Int){
        let indexpath = IndexPath(row: row, section: section)
        mainTable.reloadRows(at: [indexpath], with: .none)
//        tableView.beginUpdates()
//       tableView.reloadData()
//        tableView.endUpdates()
    }
    
    func currentTabChanged(tab: String) {
        currentTab = tab
        if(tab == "Ticket"){
            mainTableBottomConstraints.constant = 30
            ticketTabFooter.isHidden = false
        } else {
            mainTableBottomConstraints.constant = 0
            ticketTabFooter.isHidden = true

        }
        updateNumberOfRowsAndSections()
        print(currentTab)
        mainTable.reloadData()
    }
}

