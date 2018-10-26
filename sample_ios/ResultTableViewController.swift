//
//  ResultTableViewController.swift
//  sample_ios
//
//  Created by USER on 2018/10/24.
//  Copyright © 2018年 USER. All rights reserved.
//

import UIKit

class ResultTableViewController :UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //itemにItemクラスを宿す
    //var item: Item?
    //複数のデータを格納するための箱
    //var items = [Item]()
    
    //var data = ["dog","cat"]
    var speed_data = [Any]()
    var yakudo_data = [Any]()
    
    var dataList:[String] = []
    
    
   
    @IBOutlet weak var table_speed: UITableView!
    @IBOutlet weak var table_yakudo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_speed.delegate = self
        table_speed.dataSource = self
        
        table_yakudo.delegate = self
        table_yakudo.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return self.speed_data.count
        }else{
            return self.yakudo_data.count
        //let total = self.speed_data.count + self.yakudo_data.count
        //return total
        //return item.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
        
            // セルの型を作る
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "speedCell")
            // セルに表示するテキストを作る
            let spd = speed_data as! [String]
            //let ykd = yakudo_data as! [String]
            //let calc_data = spd + ykd
            //print(calc_data)
            cell.textLabel?.text = spd[indexPath.row]
            // セルをリターンする
            return cell
            
        }else {
            
            // セルの型を作る
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "yakudoCell")
            // セルに表示するテキストを作る
            //let spd = speed_data as! [String]
            let ykd = yakudo_data as! [String]
            //let calc_data = spd + ykd
            //print(calc_data)
            cell.textLabel?.text = ykd[indexPath.row]
            // セルをリターンする
            return cell
            
        }
    }
    
    
    
    
}
