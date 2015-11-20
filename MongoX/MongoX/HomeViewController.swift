//
//  FirstViewController.swift
//  MongoX
//
//  Created by AbysmLi on 6/28/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var usericon1: UIImageView!
    @IBOutlet weak var usericon2: UIImageView!
    @IBOutlet weak var usericon3: UIImageView!
    
    @IBOutlet weak var follow1: UIButton!
    @IBOutlet weak var follow2: UIButton!
    @IBOutlet weak var follow3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scoller.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 1290, right: 0)
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
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSFontAttributeName: UIFont(name: "HYXiZhongYuanJ", size: 11)!]
        appearance.setTitleTextAttributes(attributes, forState: UIControlState.Normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

