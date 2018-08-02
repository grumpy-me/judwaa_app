//
//  TableViewController.swift
//  movie
//
//  Created by Subha on 13/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, MovieHeaderDelegate, synopsisCellDelegate {
   
    var currentTab:String = "Ticket"
    
    var numberOfSections : Int = 1
    
    var numberOfRowsInSections : [Int] = [1,1,1,1,1,1,1,1,1,1,1,1,1,1]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerNib = UINib.init(nibName: "movieHeader", bundle: Bundle.main)
        
        tableView.register(headerNib, forCellReuseIdentifier: "MovieHeader")
        
        tableView.register(UINib(nibName: "SongsCells", bundle: Bundle.main), forCellReuseIdentifier: "songsCell")
        tableView.register(UINib(nibName: "ProfileTableCells", bundle: Bundle.main), forCellReuseIdentifier: "profileTableCell")
        tableView.register(UINib(nibName: "CriticsTableCell", bundle: Bundle.main), forCellReuseIdentifier: "criticTableCell")
        tableView.register(UINib(nibName: "SynopsisCell", bundle: Bundle.main), forCellReuseIdentifier: "synopsisCell")
        tableView.register(UINib(nibName: "SelfRatingTableCell", bundle: Bundle.main), forCellReuseIdentifier: "selfRatingTableCell")
        tableView.register(UINib(nibName: "ReviewersTableCell", bundle: Bundle.main), forCellReuseIdentifier: "reviewerTableCell")

        
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisCell", for: indexPath) as! SynopsisCell
                cell.delegate = self
                cell.frame.size.height = cell.descriptionLabel.frame.size.height + cell.moreButton.frame.size.height
                return cell
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if currentTab == "Synopsis" && section > 0 {
            return 25
        }else{
            return 0.01
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

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
        tableView.reloadRows(at: [indexpath], with: .none)
//        tableView.beginUpdates()
//       tableView.reloadData()
//        tableView.endUpdates()
    }
    
    func currentTabChanged(tab: String) {
        currentTab = tab
        updateNumberOfRowsAndSections()
        print(currentTab)
        tableView.reloadData()
    }
    
//    func addStarRating(superview: UIView, rating: Float) {
//        let view = UIView()
//        view.frame = superview.bounds
//        var stars = [UIImageView]()
//        var outline = [UIImageView]()
//
//        for x in 0...4 {
//            let starr = UIImageView()
//            starr.image = #imageLiteral(resourceName: "star")
//            starr.contentMode = .scaleAspectFit
//            if (rating - Float(x)) < 1.0 {
//                let mask = UIView()
//                mask.backgroundColor = UIColor.green
//                if Float(x) < rating {
//                    mask.frame = CGRect(x: 0, y: 0, width: starr.frame.width * CGFloat(rating - Float(x)), height: starr.frame.height)
//                    starr.mask = mask
//                }else {
//                        starr.image = nil
//                }
//            }
//            stars.append(starr)
//            let border = UIImageView()
//            border.image = #imageLiteral(resourceName: "starOutline")
//            border.contentMode = .scaleAspectFit
//            outline.append(border)
//        }
//
//        // adding constarints to the filled stars
//
//        view.addSubview(stars[0])
//        let topConstraint = stars[0].topAnchor.constraint(equalTo: view.topAnchor)
//        let bottomConstraint = stars[0].bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        let leadingConstraint = stars[0].leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        view.addConstraint(topConstraint)
//        view.addConstraint(bottomConstraint)
//        view.addConstraint(leadingConstraint)
//
//        for x in 1...4 {
//            view.addSubview(stars[x])
//            let topConstraint = stars[x].topAnchor.constraint(equalTo: view.topAnchor)
//            let bottomConstraint = stars[x].bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            let leadingConstraint = stars[x].leadingAnchor.constraint(equalTo: stars[x-1].trailingAnchor)
//            let widthConstraints = stars[x].widthAnchor.constraint(equalTo: stars[0].widthAnchor)
//            view.addConstraint(topConstraint)
//            view.addConstraint(bottomConstraint)
//            view.addConstraint(leadingConstraint)
//            view.addConstraint(widthConstraints)
//        }
//
//        let trailingConstraints = stars[4].trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        view.addConstraint(trailingConstraints)
//
//        // adding constraints to the star outlines
//
//        view.addSubview(outline[0])
//        let ttopConstraint = outline[0].topAnchor.constraint(equalTo: stars[0].topAnchor)
//        let bbottomConstraint = outline[0].bottomAnchor.constraint(equalTo: stars[0].bottomAnchor)
//        let lleadingConstraint = outline[0].leadingAnchor.constraint(equalTo: stars[0].leadingAnchor)
//        view.addConstraint(ttopConstraint)
//        view.addConstraint(bbottomConstraint)
//        view.addConstraint(lleadingConstraint)
//
//        for x in 1...4 {
//            view.addSubview(outline[x])
//            let topConstraint = outline[x].topAnchor.constraint(equalTo: stars[x].topAnchor)
//            let bottomConstraint = outline[x].bottomAnchor.constraint(equalTo: stars[x].bottomAnchor)
//            let leadingConstraint = outline[x].leadingAnchor.constraint(equalTo: outline[x-1].trailingAnchor)
//            let widthConstraints = outline[x].widthAnchor.constraint(equalTo: outline[0].widthAnchor)
//            view.addConstraint(topConstraint)
//            view.addConstraint(bottomConstraint)
//            view.addConstraint(leadingConstraint)
//            view.addConstraint(widthConstraints)
//        }
//
//        let ttrailingConstraints = outline[4].trailingAnchor.constraint(equalTo: stars[4].trailingAnchor)
//        view.addConstraint(ttrailingConstraints)
//
//
//        superview.addSubview(view)
//
//    }
    
    
}

