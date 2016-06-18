//
//  ViewController.swift
//  HelloITP
//
//  Created by Lea Marolt on 6/18/16.
//  Copyright © 2016 Lea Marolt Sonnenschein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTapped(sender: AnyObject) {
        
        textLabel.text = "Hello, World!"
        textLabel.font = UIFont(name: textLabel!.font.familyName, size: getRandomFloat())
        
    }
    
    func getRandomFloat() -> CGFloat {
        let randomFloat = CGFloat(arc4random_uniform(100))
        return randomFloat
    }
    
}

