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
    
    var dataList:[String] = []
    var speed_list = [Any]()
    var yakudo_list = [Any]()

    
    
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
        
        
        do {
            //CSVファイルのパスを取得する。
            let csvPath = Bundle.main.path(forResource: "point", ofType: "csv")
            
            //CSVファイルのデータを取得する。
            //let csvData = try String(contentsOfFile:csvPath!, encoding:String.Encoding.utf8)
            let csvData = try? NSString(contentsOfFile: csvPath!, encoding: String.Encoding.utf8.rawValue)
            
            //改行区切りでデータを分割して配列に格納する。
            dataList = csvData!.components(separatedBy:",")
            print(dataList)
        }
        
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
    
    
   
    @IBAction func send_csv(_ sender: Any) {
        
        let sendcsv = self.dataList
        
        
        guard let send_url = URL(string: "http://ef6e06da.ngrok.io/saitama/speed/")else{return}
        
        var request = URLRequest(url: send_url)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: sendcsv, options: [])
        
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print(response)
            }
            
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //このjsonが帰ってきた中身
                    print(json)
                    
                    //辞書型データから値を取り出すたびにas! [String:Any] と書かなあかん
                    let jsondata = json as! [String:Any]
                    let response_data = jsondata["result"]
                    //speedのjsonが入っている
                    print(response_data)
                    let res_data = response_data as! [Dictionary<String, Any>]
                    print(res_data)
                    let speed_json = res_data[0]
                    let yakudo_json = res_data[1]
                    let speed_value:Array = Array(speed_json.values)
                    let yakudo_value:Array = Array(yakudo_json.values)
                    
                    print(speed_value)
                    print(yakudo_value)
                    
                    
                    self.speed_list += speed_value
                    self.yakudo_list += yakudo_value
                    
                    
                    
                    
                } catch{
                    print(error)
                }
            }
            
            }.resume()
        
        
        
    }
    
    /// Segueで遷移する際のメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //ResultTableは画面推移の矢印クリックしてidentifierに名前つけた
        if segue.identifier == "ResultTable" {
            // SecondViewControllerをインスタンス化
            let resulttable = segue.destination as! ResultTableViewController
            // 値を渡す
            resulttable.speed_data = self.speed_list
            resulttable.yakudo_data = self.yakudo_list
            
        }
        
    }
    
    
    
    
    
    
    
}
