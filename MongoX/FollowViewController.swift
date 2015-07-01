//
//  FollowViewController.swift
//  MongoX
//
//  Created by AbysmLi on 7/1/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController {

    @IBOutlet weak var usericon1: UIImageView!
    @IBOutlet weak var usericon2: UIImageView!
    @IBOutlet weak var usericon3: UIImageView!
    
    @IBOutlet weak var follow1: UIButton!
    @IBOutlet weak var follow2: UIButton!
    @IBOutlet weak var follow3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        usericon1.layer.cornerRadius = 20
        usericon1.layer.masksToBounds = true
        usericon2.layer.cornerRadius = 20
        usericon2.layer.masksToBounds = true
        usericon3.layer.cornerRadius = 20
        usericon3.layer.masksToBounds = true
        
        follow1.layer.cornerRadius = 2
        follow1.layer.masksToBounds = true
        follow2.layer.cornerRadius = 2
        follow2.layer.masksToBounds = true
        follow3.layer.cornerRadius = 2
        follow3.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
