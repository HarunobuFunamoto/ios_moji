//
//  ResultViewController.swift
//  sample_ios
//
//  Created by USER on 2018/10/16.
//  Copyright © 2018年 USER. All rights reserved.
//

import UIKit

class ResultViewController:UIViewController{
    
    
    @IBOutlet weak var Yakudo: UIView!
    @IBOutlet weak var Speed: UIView!
    @IBOutlet weak var Biteki: UIView!
    
    @IBOutlet weak var Graph1: UIView!
    @IBOutlet weak var Graph2: UIView!
    @IBOutlet weak var Graph3: UIView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 枠のカラー
        Biteki.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Biteki.layer.borderWidth = 1.0
        
        // 枠のカラー
        Speed.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Speed.layer.borderWidth = 1.0
        
        // 枠のカラー
        Yakudo.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Yakudo.layer.borderWidth = 1.0
        
        
        // 枠のカラー
        Graph1.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Graph1.layer.borderWidth = 1.0
        
        // 枠のカラー
        Graph2.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Graph2.layer.borderWidth = 1.0
        
        // 枠のカラー
        Graph3.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        Graph3.layer.borderWidth = 1.0
        
        
        
    }
    
    
}
