//
//  ViewController.swift
//  Judwaa_App
//
//  Created by Apple on 20/07/18.
//  Copyright © 2018 SampleLearning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, whichCells {
    
    
    var id: Int=0
    func whichCell(data: Int) {
        
        id=data
        print(id)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 6 // from the api
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row==0{
            
            let cell=tableView.dequeueReusableCell(withIdentifier: "buttons", for: indexPath) as! buttons
            // this is where set the delegate to self, where the item is created
            cell.delegate=self
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
                let cell=tableView.dequeueReusableCell(withIdentifier: "TheCell1", for: indexPath) as! TheCell1
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0) {
            
            return 60.0;
        }
        
        return 200.0;
        
    }
    
    
    @IBOutlet var mainTable: UITableView!
    @IBOutlet var legend: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mainTable.register(UINib(nibName:"TheCell" , bundle: .main), forCellReuseIdentifier: "TheCell")
        
        mainTable.register(UINib(nibName:"buttons" , bundle: .main), forCellReuseIdentifier: "buttons")
        
        mainTable.register(UINib(nibName:"TheCell1" , bundle: .main), forCellReuseIdentifier: "TheCell1")
        
        mainTable.dataSource=self
        mainTable.delegate=self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: Make the legend.
    
}

