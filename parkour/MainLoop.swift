//
//  MainLoop.swift
//  parkour
//
//  Created by Shu Iida on 2016/03/08.
//  Copyright © 2016年 Shu Iida. All rights reserved.
//

import Foundation
import UIKit

class MainLoop:NSObject {
    var buildings:[Obstacle] = []
    var buildings_length:Int = 15
    
    init(mainView:UIView) {
        // Instantiate ten buildings.
        for i in 0...buildings_length {
            if let build:UIImage? = UIImage(named: "building01.png") {
                let b:Obstacle = Obstacle(x:(Float)(i*50),
                                          y:Float(UIScreen.mainScreen().bounds.height)-100,
                                          h:100,
                                          w:50,
                                          img:build!)
                buildings.append(b)
                mainView.addSubview(b.imgView)
            }
        }
    }
    
    func update(timer : NSTimer) {
        for i in 0...buildings_length {
            buildings[i].move()
            
            if buildings[i].xpos <= -50 {
                
                //２個前
                let double_previous:Int = i-2 < 0 ? buildings_length-i : i-2
                
                buildings[i].change_success()
                if buildings[double_previous].missFlg == false && (Int)(arc4random_uniform(100))%3 != 0 {
                    buildings[i].change_miss()
                    print("\(i) =  miss");
                }
                buildings[i].xpos = Float(buildings_length*50);
                buildings[i].setHeight(50 + (Int)(arc4random_uniform(100)));
            }
        }
    }
    func update_b(timer : NSTimer){
        
    }
}