//
//  ViewController.swift
//  fb
//
//  Created by Apple on 01/08/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,whichCells {
    
    var id: Int=0
    func whichCell(data: Int) {
        
        id=data
        print(id)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        
        let nell=tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as!  headerCell
        nell.delegate=self
        
        if indexPath.row==0{
            
        
            return nell
        }
        else{
            
            // put the id condition here
            
            return cell
            
        }
    
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let header=tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerCell
//
//        return header
//
//    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        if indexPath.row==0{
//        return UITableViewAutomaticDimension
//        }
//        else
//        {
//            return UITableViewAutomaticDimension
//        }
//        
//    }
    
    @IBOutlet var table: UITableView!
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate=self
        table.dataSource=self
        
        table.register(UINib(nibName: "tableCell", bundle: Bundle.main), forCellReuseIdentifier: "tableCell")
        
        table.register(UINib(nibName: "headerCell", bundle: Bundle.main), forCellReuseIdentifier: "headerCell")
        
        table.rowHeight=UITableViewAutomaticDimension
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

