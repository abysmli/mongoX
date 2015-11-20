//
//  MyViewController.swift
//  MongoX
//
//  Created by AbysmLi on 7/2/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icon.layer.cornerRadius = 40
        icon.layer.masksToBounds = true
        //self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
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
