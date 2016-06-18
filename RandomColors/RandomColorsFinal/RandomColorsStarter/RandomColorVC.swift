//
//  RandomColorVC.swift
//  RandomColorsStarter
//
//  Created by Lea Marolt on 6/18/16.
//  Copyright © 2016 Lea Marolt Sonnenschein. All rights reserved.
//

import UIKit

class RandomColorVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var topR : CGFloat = 0
    var topG : CGFloat = 0
    var topB : CGFloat = 0
    
    var middleR : CGFloat = 0
    var middleG : CGFloat = 0
    var middleB : CGFloat = 0
    
    var bottomR : CGFloat = 0
    var bottomG : CGFloat = 0
    var bottomB : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setViewsToRandomColors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getRandomFloat() -> CGFloat {
        let randomFloat = CGFloat(arc4random_uniform(100))/100.0
        return randomFloat
    }
    
    func getRandomColor() -> UIColor {
        return UIColor(red: getRandomFloat(), green: getRandomFloat(), blue: getRandomFloat(), alpha: 1.0)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            setViewsToRandomColors()
        }
    }
    
    func setViewsToRandomColors() {
        setTopColor()
        setMiddleColor()
        setBottomColor()
    }
    
    func setTopColor() {
        topView.backgroundColor = getRandomColor()
        let colors = CGColorGetComponents(topView.backgroundColor!.CGColor)
        topR = colors[0]
        topG = colors[1]
        topB = colors[2]
    }
    
    func setMiddleColor() {
        middleView.backgroundColor = getRandomColor()
        let colors = CGColorGetComponents(middleView.backgroundColor!.CGColor)
        middleR = colors[0]
        middleG = colors[1]
        middleB = colors[2]
    }
    
    func setBottomColor() {
        bottomView.backgroundColor = getRandomColor()
        let colors = CGColorGetComponents(bottomView.backgroundColor!.CGColor)
        bottomR = colors[0]
        bottomG = colors[1]
        bottomB = colors[2]
    }

    @IBAction func jazzItUp(sender: AnyObject) {
        setViewsToRandomColors()
    }
    
    @IBAction func topRightSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
        
        if (topB < 1) {
            topB += 0.2
        } else {
            showAlert(true)
        }
        
        UIView.animateWithDuration(0.2) {
            self.topView.backgroundColor = UIColor(red: self.topR, green: self.topG, blue: self.topB, alpha: 1.0)
        }
    }
    
    @IBAction func topLeftSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
    
        if (topB > 0) {
            topB -= 0.2
        } else {
            showAlert(false)
        }
        
        UIView.animateWithDuration(0.2) {
            self.topView.backgroundColor = UIColor(red: self.topR, green: self.topG, blue: self.topB, alpha: 1.0)
        }
    }
    
    @IBAction func middleRightSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
        
        if (middleG < 1) {
            middleG += 0.2
        } else {
            showAlert(true)
        }
        
        UIView.animateWithDuration(0.2) {
            self.middleView.backgroundColor = UIColor(red: self.middleR, green: self.middleG, blue: self.middleB, alpha: 1.0)
        }
    }
    
    @IBAction func middleLeftSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
        
        if (middleG > 0) {
            middleG -= 0.2
        } else {
            showAlert(false)
        }
        
        UIView.animateWithDuration(0.2) {
            self.middleView.backgroundColor = UIColor(red: self.middleR, green: self.middleG, blue: self.middleB, alpha: 1.0)
        }
    }
    
    @IBAction func bottomRightSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
        
        if (bottomR < 1) {
            bottomR += 0.2
        } else {
            showAlert(true)
        }
        
        UIView.animateWithDuration(0.2) {
            self.bottomView.backgroundColor = UIColor(red: self.bottomR, green: self.bottomG, blue: self.bottomB, alpha: 1.0)
        }
    }
    
    @IBAction func bottomLeftSwipe(sender: AnyObject) {
        // manipulating the blue component of the top view's RGB
        
        if (bottomR > 0) {
            bottomR -= 0.2
        } else {
            showAlert(false)
        }
        
        UIView.animateWithDuration(0.2) {
            self.bottomView.backgroundColor = UIColor(red: self.bottomR, green: self.bottomG, blue: self.bottomB, alpha: 1.0)
        }
    }
    
    func showAlert(up: Bool) {
        let direction: String = up ? "up" : "down"
        
        let alertView = UIAlertView(title: "Whoops!", message: "We went to far \(direction) :(", delegate: nil, cancelButtonTitle: "OKAY")
        alertView.show()
    }
}

