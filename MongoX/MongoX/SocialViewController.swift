//
//  SecondViewController.swift
//  MongoX
//
//  Created by AbysmLi on 6/28/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    
    @IBOutlet weak var discard_button: UIButton!
    @IBOutlet weak var like_button: UIButton!
    @IBOutlet weak var chat_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        discard_button.layer.cornerRadius = 25
        discard_button.layer.masksToBounds = true
        discard_button.layer.borderColor = UIColor.grayColor().CGColor
        discard_button.layer.borderWidth = 0.5
        
        like_button.layer.cornerRadius = 25
        like_button.layer.masksToBounds = true
        like_button.layer.borderColor = UIColor.grayColor().CGColor
        like_button.layer.borderWidth = 0.5

        chat_button.layer.cornerRadius = 20
        chat_button.layer.masksToBounds = true
        chat_button.layer.borderColor = UIColor.grayColor().CGColor
        chat_button.layer.borderWidth = 0.5

        self.view.bringSubviewToFront(self.discard_button)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        
        let imagewidth = CGFloat(300.0)
        let imageheight = CGFloat(400.0)
        let positionX = CGFloat(screenWidth / 2) - CGFloat(imagewidth / 2)
        let positionY = CGFloat(90.0)
        
        for i in 1...8 {
            let friendView = FriendPhotoView(frame: CGRectMake(positionX, positionY, imagewidth, imageheight), imagename: String(i), discard_button: discard_button, like_button: like_button)
            self.view.addSubview(friendView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

