//
//  ViewController.swift
//  Learning-FaboSwiftDocs6
//
//  Created by 小室沙央里 on 2022/08/30.
//  ①セクション分けしたUITableViewを作る
//  ②UITextFieldに文字数制限を設ける

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // ①Tableで使用する配列を定義
    private let myFruits:NSArray = ["apple", "banana", "strawberry" ]
    private let myColors:NSArray = ["green", "blue", "red"]
    
    // ①Sectionで使用する配列を定義
    private let mySections:NSArray = ["Fruits", "Colors"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ①
        // Status Barの高さを取得
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Viewの高さと幅を取得
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成（Status barの高さ分ずらして表示）
        let myTableView: UITableView = UITableView(frame: CGRect(x:0,y:barHeight, width: displayWidth, height: displayHeight))
        
        // Cell名の登録
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        self.view.addSubview(myTableView)
        
        // ②
        let myTextField: UITextField = UITextField(frame: CGRect(x:0, y:0, width: 200, height: 20))
        myTextField.text = "Hello"
        myTextField.delegate = self
        
        // 枠の線を表示
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height-100)
        self.view.addSubview(myTextField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // ①
    //　セクションを返す
    func numberOfSections(in tableView: UITableView) -> Int {
        print(mySections.count)
        return mySections.count
    }

    // セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    // Cellが選択されたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value:\(myFruits[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value:\(myColors[indexPath.row])")
        }
    }
    
    // テーブルに表示する配列の総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myFruits.count
        } else if section == 1 {
            return myColors.count
        } else {
            return 0
        }
    }
    
    // Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myFruits[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myColors[indexPath.row])"
        }
        
        return cell
    }
    
    // ②
    // テキストが編集されたときに呼ばれる
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        let maxLength: Int = 6
        
        // 入力済みの文字と入力された文字を合わせて取得
        let str = textField.text! + string
        
        if str.count <= maxLength {
            return true
        }
        print("6文字を超えています")
        return false
    }
}

