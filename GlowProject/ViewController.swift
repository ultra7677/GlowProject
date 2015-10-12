//
//  ViewController.swift
//  GlowProject
//
//  Created by ultra on 10/10/15.
//  Copyright © 2015 ultra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       let label1 = UILabel(frame: CGRectMake(10, 10, 200, 200))
        label1.text = "dd"
        label1.sizeToFit()
        label1.backgroundColor = UIColor(red: 10, green: 0, blue: 200, alpha: 0.5)
       view.addSubview(label1)
        
    }

}

