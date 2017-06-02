//
//  ExploreVC.swift
//  TwitterGuest
//
//  Created by Robert Alva on 6/1/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    var arrTest : [String] = ["Test1","Test2","Test3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}







extension ExploreVC:UITableViewDataSource,UITableViewDelegate{
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 50
        return arrTest.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as! TrendingCell
        
        cell.textLabel?.text = arrTest[indexPath.row] + "asdasdaddas"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
