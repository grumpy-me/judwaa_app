//
//  TableViewController.swift
//  movie
//
//  Created by Subha on 13/07/18.
//  Copyright © 2018 Subha. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MovieHeaderDelegate, synopsisCellDelegate {

    
    var apiData = [JSON(),JSON()]
    
    var apiURL1 = "https://win.justdial.com/21may2018/movie_review.php?case=detail&mn=Mission-Impossible-Fallout-English-Movie&nid=12058016&mobile=8123428945&wap=2&jdlite=0&skipsieve=0&posterWidth=220&sieve=%7B%22name%22%3A%22movieResult%22%2C%22selector%22%3A%22movieDetail%22%2C%22runInit%22%3Atrue%7D"
    var apiURL2 = "https://win.justdial.com/21may2018/searchziva.php?city=Bangalore&state=&case=spcall&stype=category_list&search=Mission-Impossible-Fallout-English-Movie&national_catid=12058016&lat=&long=&area=Hdfc%20Bank%20koramangala&nextdocid=&docidPointer=&gcity=&garea=&glat=&glon=&pg_no=1&rnd1=0.86627&rnd2=0.86230&rnd3=0.78563&wap=2&login_mobile=8123428945&sid=&sver=&tid=&moviedate=2018-08-07&mvbksrc=ft%2Cpvr%2Ccinemax%2Cfc&jdlite=0&attribute_values=&docid=&paidstatus=&darea_flg=1&catid=&main_catname=&movie_release_date=&skipsieve=0&ismovie=1&querySieve=search&querySieve=city&querySieve=area&sieve=%7B%22name%22%3A%22movieResult%22%2C%22selector%22%3A%22movieResult%22%2C%22runInit%22%3Atrue%7D"
    @IBOutlet weak var mainTableBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var ticketTabFooter: UIView!
    
    
    @IBOutlet weak var mainTable: UITableView!
    var id : Int = 1
    var currentTab:String = "Ticket"
    
    var numberOfSections : Int = 1
    
    var numberOfRowsInSectionsssss : [Int] = [1,1,1,1,3,1,1,1,1,1,1,1,1,1]

    
    func apiCallForPageSetup(urlAPI : String, index: Int)
    {
        Alamofire.request(urlAPI, method: .get).responseJSON
            {
                response in
                
                if response.result.isSuccess
                {
            
                    self.apiData[index] = JSON(response.result.value!)
                    print("success")
                    
                    DispatchQueue.main.async {
                        print("reloadTable")
                        if  index == 1{
                            self.updateData1(json: self.apiData[1])
                        }
                        self.mainTable?.reloadData()
                    }
                    
                }
                    
                else
                {
                    print("error occured : \(String(describing: response.result.error))")
                }
        }
    }
    
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
        
        apiCallForPageSetup(urlAPI: apiURL1, index: 0)
        apiCallForPageSetup(urlAPI: apiURL2, index: 1)
        

    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentTab == "Ticket" {
            if(section == 1) {
                return numberOfCells+1
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
                
                if apiData.count > 0 {
                if apiData[0]["moviedetails"] != JSON.null && apiData[0]["trailerimg"] != JSON.null
                {
                    cell.movieName.text = apiData[0]["moviedetails"]["Name"].stringValue + apiData[0]["moviedetails"]["Certificate"].stringValue
                    if let url = URL(string: apiData[0]["trailerimg"].stringValue){
                        do {
                            let data = try Data(contentsOf: url)
                            cell.moviePoster.image = UIImage(data: data)
                        }catch let err {
                            print(err)
                        }
                    }
                }
                }
                
                return cell
            case 1:
                if indexPath.row==0{
                    
                    let cell=tableView.dequeueReusableCell(withIdentifier: "buttons", for: indexPath) as! buttons
                    // this is where set the delegate to self, where the item is created
                    //   cell.delegate=self
                    
                    
                    return cell
                    
                }
                    
                else{
                    
                   
                        
                        let
                        cell=tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! TheCell
                    
                    cell.threatre.text=apiData[1]["results"]["data"][indexPath.row-1][nameIndex].stringValue + "," + apiData[1]["results"]["data"][indexPath.row-1][newaddressIndex].stringValue
                    cell.km.text=apiData[1]["results"]["data"][indexPath.row-1][distanceIndex].stringValue
                    
                        cell.countVar = 4*(indexPath.row-1)
                        cell.updatehight()
                        cell.collection.reloadData()

                        return cell
                    
                        
                    
                }
            default:
                return UITableViewCell()
            }
        }
        if currentTab == "Reviews" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                
                if apiData.count > 0 {
                if apiData[0]["moviedetails"] != JSON.null && apiData[0]["trailerimg"] != JSON.null
                {
                    cell.movieName.text = apiData[0]["moviedetails"]["Name"].stringValue + apiData[0]["moviedetails"]["Certificate"].stringValue
                    if let url = URL(string: apiData[0]["trailerimg"].stringValue){
                        do {
                            let data = try Data(contentsOf: url)
                            cell.moviePoster.image = UIImage(data: data)
                        }catch let err {
                            print(err)
                        }
                    }
                }
                }
                
                cell.delegate = self
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "criticTableCell", for: indexPath) as! CriticsTableCell
                cell.numOfCritic = 5
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
                cell.delegate = self
                print("in Synopsis")
                
                if apiData.count > 0 {
                if apiData[0]["moviedetails"] != nil /*&& apiData[0]["trailerimg"] != nil */
                {
                    cell.movieName.text = apiData[0]["moviedetails"]["Name"].stringValue + apiData[0]["moviedetails"]["Certificate"].stringValue
                    if let url = URL(string: apiData[0]["trailerimg"].stringValue){
                        do {
                            let data = try Data(contentsOf: url)
                            cell.moviePoster.image = UIImage(data: data)
                        }catch let err {
                            print(err)
                        }
                    }
                }
                }
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisCell", for: indexPath) as! SynopsisCell
                cell.delegate = self
                
                if apiData.count > 0 {
                cell.descriptionLabel.text = apiData[0]["moviedetails"]["Synopsis"].stringValue
                if cell.descriptionLabel.numberOfVisibleLines < 6 {
                    
                }
                }
                cell.frame.size.height = cell.descriptionLabel.frame.size.height + cell.moreButton.frame.size.height
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableCells
                if apiData.count > 0 {
                if apiData[0]["moviedetails"] != JSON.null && apiData[0]["moviedetails"]["artist_info"] != JSON.null
                {
                    if let data = apiData[0]["moviedetails"]["artist_info"]["Cast"].arrayObject// as! [[String : String]]
                    {
                        cell.profileData = data as! [[String : String]]
                        cell.numberOfCelebrity = data.count
                        cell.collectionView.reloadData()
                        
                    }
                }
                }
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as! ProfileTableCells
                if apiData.count > 0
                {
                    
                    if apiData[0]["moviedetails"] != JSON.null && apiData[0]["moviedetails"]["artist_info"] != JSON.null
                    {
                        if let data = apiData[0]["moviedetails"]["artist_info"]["Crew"].arrayObject// as! [[String : String]]
                        {
                            cell.profileData = data as! [[String : String]]
                            cell.numberOfCelebrity = data.count
                            cell.collectionView.reloadData()

                        }
                    }

                    
                }
                return cell
            default:
                return UITableViewCell()
            }
        }
        if currentTab == "Songs" {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeader") as! MovieHeader
                
                if apiData.count > 0 {
                if apiData[0]["moviedetails"] != JSON.null && apiData[0]["trailerimg"] != JSON.null
                {
                    cell.movieName.text = apiData[0]["moviedetails"]["Name"].stringValue + apiData[0]["moviedetails"]["Certificate"].stringValue
                    if let url = URL(string: apiData[0]["trailerimg"].stringValue){
                        do {
                            let data = try Data(contentsOf: url)
                            cell.moviePoster.image = UIImage(data: data)
                        }catch let err {
                            print(err)
                        }
                    }
                }
                }
                
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
            numberOfSections = 4
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
    
    var json:JSON = []
    var nameIndex: Int = -1
    var distanceIndex: Int = -1
    var newaddressIndex: Int = -1
    var numberOfCells: Int = 0
    
    
    func updateData1(json: JSON){
        
        for x in json["results"]["columns"]
        {
            nameIndex=nameIndex+1
            if x.1 == "name" {
                
                break
            }
        }
        
        for x in json["results"]["columns"]
        {
            distanceIndex=distanceIndex+1
            if x.1 == "distance" {
                
                break
            }
        }
        
        for x in json["results"]["columns"]
        {
            newaddressIndex=newaddressIndex+1
            if x.1 == "NewAddress" {
                
                break
            }
        }
        
        numberOfCells = json["results"]["data"].count
        print(json["results"]["data"][1][nameIndex].stringValue)
}
}
