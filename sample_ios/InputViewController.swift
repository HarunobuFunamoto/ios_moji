//
//  InputViewController.swift
//  sample_ios
//
//  Created by USER on 2018/10/16.
//  Copyright © 2018年 USER. All rights reserved.
//

import UIKit
import Sketch


class InputViewController:UIViewController, SketchViewDelegate{
    
    //@IBOutlet weak var sketcharea: SketchView!

    
    
    @IBOutlet weak var textBorder: UIView!
    @IBOutlet weak var textNum: UILabel!
    @IBOutlet weak var sketcharea: SketchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
        textNum.layer.borderColor = UIColor.black.cgColor
        
        // 枠の幅
        textNum.layer.borderWidth = 1.0
        
        // 枠を角丸にする場合
        textNum.layer.cornerRadius = 10.0
        
        // 枠のカラー
        textBorder.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        textBorder.layer.borderWidth = 1.0
        self.view.sendSubview(toBack:textBorder)
        
        
        sketcharea.lineWidth = CGFloat(5)
        //self.view.addSubview(sketcharea)
        self.view.bringSubview(toFront:sketcharea)
        
    }
    
    @IBAction func Pen() {
        sketcharea.drawTool = SketchToolType.pen
        sketcharea.lineWidth = CGFloat(5)
    }
    
    
    @IBAction func DeleteAll() {
        sketcharea.clear()
    }
    
    
    @IBAction func Eraser() {
        sketcharea.drawTool = SketchToolType.eraser
        sketcharea.lineWidth = CGFloat(20)
    }
    
    
    
    
    
    
}
