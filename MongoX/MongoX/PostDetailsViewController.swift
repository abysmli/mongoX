//
//  PostDetailsViewController.swift
//  MongoX
//
//  Created by AbysmLi on 7/1/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    @IBOutlet weak var posticon: UIImageView!
    @IBOutlet weak var followbutton: UIButton!
    @IBOutlet weak var buybutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        posticon.layer.cornerRadius = 15
        posticon.layer.masksToBounds = true
        followbutton.layer.cornerRadius = 2
        followbutton.layer.masksToBounds = true
        buybutton.layer.cornerRadius = 2
        buybutton.layer.masksToBounds = true
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
