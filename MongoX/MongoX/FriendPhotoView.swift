//
//  FriendPhotoView.swift
//  MongoX
//
//  Created by AbysmLi on 8/5/15.
//  Copyright (c) 2015 AbysmLi. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class FriendPhotoView: UIView {
    
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var oldx: CGFloat = 0
    var oldy: CGFloat = 0
    var rotateSum: CGFloat = 0
    
    var like_button: UIButton!
    var discard_button: UIButton!
    
    init(frame: CGRect, imagename:String, discard_button: UIButton, like_button: UIButton) {
        
        super.init(frame: frame)
        // Initialization code
        
        self.like_button = like_button
        self.discard_button = discard_button
        
        let panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
        //randomize view color
        
        self.backgroundColor = UIColor(netHex:0xFFFFFF)
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        
        let friendphoto:UIImage = UIImage(named: imagename)!
        let image: UIImageView = UIImageView(image: friendphoto)
        image.contentMode = .ScaleAspectFit

        image.frame = CGRectMake(10, 10, 280, 330)
        self.addSubview(image)
        
        let friendphoto_avatar:UIImage = UIImage(named: "posticon1")!
        let image_avatar:UIImageView = UIImageView(image: friendphoto_avatar)
        image_avatar.frame = CGRectMake(10, 340, 40, 40)
        image_avatar.layer.cornerRadius = 20
        image_avatar.layer.masksToBounds = true
        self.addSubview(image_avatar)
        
        let username:UILabel = UILabel(frame: CGRectMake(60, 340, 200, 20))
        username.text = "我是一只小小鸟"
        username.font = UIFont(name: "HYXiZhongYuanJ", size: 12)
        self.addSubview(username)
        
        let userdesc:UILabel = UILabel(frame: CGRectMake(60, 360, 230, 20))
        userdesc.text = "我的座右铭就是混蛋混蛋更混蛋"
        userdesc.textColor = UIColor.grayColor()
        userdesc.font = UIFont(name: "HYXiZhongYuanJ", size: 10)
        self.addSubview(userdesc)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        
        let diff = oldx - translation.x
        self.rotateSum += diff
        self.transform = CGAffineTransformRotate(self.transform, -(diff/2000))
        
        if (translation.x < -50) {
            self.discard_button.highlighted = true
            UIView.animateWithDuration(0.3, animations: {
                self.layer.opacity = 0.5
            })
        } else {
            self.discard_button.highlighted = false
            UIView.animateWithDuration(0.3, animations: {
                self.layer.opacity = 1
            })
        }
        
        if (translation.x > 50) {
            self.like_button.highlighted = true
            UIView.animateWithDuration(0.3, animations: {
                self.layer.borderColor = UIColor.orangeColor().CGColor
                self.layer.shadowColor = UIColor.orangeColor().CGColor
            })
            
        } else {
            self.like_button.highlighted = false
            UIView.animateWithDuration(0.3, animations: {
                self.layer.borderColor = UIColor.grayColor().CGColor
                self.layer.shadowColor = UIColor.blackColor().CGColor
            })
        }
        
        if(recognizer.state == UIGestureRecognizerState.Ended) {
            if (translation.x > 50 || translation.x < -50) {
                UIView.animateWithDuration(0.2, animations: {
                    self.layer.opacity = 0
                }, completion: {(successed: Bool) in
                    let screenSize: CGRect = UIScreen.mainScreen().bounds
                    let screenWidth = screenSize.width
                    //let screenHeight = screenSize.height
                    let imagewidth = CGFloat(300.0)
                    let imageheight = CGFloat(400.0)
                    let positionX = CGFloat(screenWidth / 2) - CGFloat(imagewidth / 2)
                    let positionY = CGFloat(90.0)
                    let friendView = FriendPhotoView(frame: CGRectMake(positionX, positionY, imagewidth, imageheight), imagename: "\(Int(arc4random()%7)+1)", discard_button: self.discard_button, like_button: self.like_button)
                    self.superview?.insertSubview(friendView, atIndex: 7)
                    self.removeFromSuperview()
                })
            } else {
                UIView.animateWithDuration(0.2, animations: {
                    self.like_button.highlighted = false
                    self.transform = CGAffineTransformRotate(self.transform, self.rotateSum/2000)
                    self.center = CGPointMake(self.lastLocation.x, self.lastLocation.y)
                    self.layer.shadowRadius = 0
                    self.layer.shadowOpacity = 0
                })
            }
            
            
        }
        oldx = translation.x
        oldy = translation.y
        //println( "x: \(translation.x) + y:\(translation.y)" )
    }
    
    override func touchesBegan(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        // Promote the touched view
        
        //self.superview?.bringSubviewToFront(self)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 0
        self.layer.shadowOpacity = 0
        
        UIView.animateWithDuration(0.3, animations: {
            self.layer.shadowRadius = 3
            self.layer.shadowOpacity = 0.7
        })
        
        // Remember original location
        lastLocation = self.center
    }
    /*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // Promote the touched view
        
        //self.superview?.bringSubviewToFront(self)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 0
        self.layer.shadowOpacity = 0
        
        UIView.animateWithDuration(0.3, animations: {
            self.layer.shadowRadius = 3
            self.layer.shadowOpacity = 0.7
        })
        
        // Remember original location
        lastLocation = self.center
    }
    */
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
}
