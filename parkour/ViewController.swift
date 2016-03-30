//
//  ViewController.swift
//  parkour
//
//  Created by Shu Iida on 2016/03/01.
//  Copyright © 2016年 Shu Iida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var player: UIImageView!
    var timer : NSTimer!
    var loop : MainLoop!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loop = MainLoop(mainView: self.view)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: loop, selector:"update:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

