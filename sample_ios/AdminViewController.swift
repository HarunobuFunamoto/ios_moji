//
//  ViewController.swift
//  sample_ios
//
//  Created by USER on 2018/10/16.
//  Copyright © 2018年 USER. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var adminTextbox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let textField = UITextField()
        //定義したメンバー変数はpythonと違い引数に渡さなくても中で直接使えば良い
        
        textbox.delegate = self
        textbox.placeholder = "IDもしくは氏名を入力"
        textbox.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textbox.clearButtonMode = UITextFieldViewMode.always
        
        self.view.addSubview(textbox)
        
        
        adminTextbox.delegate = self
        adminTextbox.placeholder = "登録済みのデータを呼び出し"
        adminTextbox.backgroundColor = UIColor(white: 0.9, alpha: 1)
        adminTextbox.clearButtonMode = UITextFieldViewMode.always
        
        self.view.addSubview(adminTextbox)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }
    
    
    
    @IBAction func send_shinki(_ sender: Any) {
        
        
        let shinkiText = self.textbox.text!
        let sendData = ["name":shinkiText]
        
        //http://64f2467d.ngrok.io/saitama/
        //http://localhost:8000/saitama/
        
        guard let send_url = URL(string: "http://localhost:8000/saitama/")else{return}
        
        var request = URLRequest(url: send_url)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: sendData, options: [])
        
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
                    print(json)
                } catch{
                    print(error)
                }
            }
            
        }.resume()
        
        
    }
    
    
}




