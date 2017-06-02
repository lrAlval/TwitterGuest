//
//  HomeVC.swift
//  TwitterGuest
//
//  Created by Robert Alva on 6/1/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        self.navigationItem.title = "Home"
        
        let l_button = UIButton(type: UIButtonType.custom)
        l_button.setTitle("Add New follower", for: UIControlState.normal)
        l_button.addTarget(self, action: #selector(HomeVC.pressLeftButton), for: UIControlEvents.touchUpInside)
        l_button.setTitleColor(UIColor.black, for: UIControlState.normal)
        l_button.titleLabel!.font = UIFont(name: "Helvetica", size: 10)
        l_button.sizeToFit()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: l_button)
        
        let r_button = UIButton(type: UIButtonType.custom)
        r_button.setTitle("New Tweet", for: UIControlState.normal)
        r_button.addTarget(self, action: #selector(HomeVC.pressRigthButton), for: UIControlEvents.touchUpInside)
        r_button.setTitleColor(UIColor.black, for: UIControlState.normal)
        r_button.titleLabel!.font = UIFont(name: "Helvetica", size: 10)
        r_button.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: r_button)
        
        
        
    }

    
    func pressRigthButton(){
        let NewTweetVC = UIStoryboard(name: "LoginFlow", bundle: Bundle.main).instantiateViewController(withIdentifier: "newtweet") as! NewTweetVC
         self.navigationController?.pushViewController(NewTweetVC, animated: true)
        
    }
    
    func pressLeftButton(){
        let FollowerVC = UIStoryboard(name: "LoginFlow", bundle: Bundle.main).instantiateViewController(withIdentifier: "follower") as! FollowerVC
        self.navigationController?.pushViewController(FollowerVC, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}





extension HomeVC:UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}


















