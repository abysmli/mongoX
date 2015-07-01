//
//  FirstViewController.swift
//  MongoX
//
//  Created by AbysmLi on 6/28/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scoller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scoller.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 1290, right: 0)
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

