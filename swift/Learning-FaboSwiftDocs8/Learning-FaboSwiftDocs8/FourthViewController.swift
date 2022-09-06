//
//  FourthViewController.swift
//  Learning-FaboSwiftDocs8
//
//  Created by 小室沙央里 on 2022/09/06.
//
// ①UIViewにトランジションをつける(ViewController)
// ②タッチイベントの有効/無効を切り替える(ViewController)
// ③GestureRecognizerのイベント取得(SecondViewController)
// ④UIAlertControllerをパスワード形式にする(ThirdViewController)
// ⑤UIAlertControllerで文字数制限を設ける（ThirdViewController）
// ⑥TableViewのボタンの拡張(FourthViewController)

import UIKit

class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // ⑥
    // Tableで使用する配列
    var myItems: [String] = ["TEST1", "TEST2", "TEST3"]
    var myTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fourth View"
        self.view.backgroundColor = UIColor.orange

        // Status Barの高さと幅を取得
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Cellが選択されたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }
    
    // Cellの総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return myItems.count
    }
    
    // Editableの状態にする
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        print("canEditRowAtIndexPath")
        return true
    }
    
    // 特定の行のボタン操作を有効にする
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("commitEdittingStyle:\(editingStyle)")
    }
    
    // Cellに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAtIndexPath")
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel?.text = "\(myItems[IndexPath.row])"
        
        return cell
    }
    
    // Buttonを拡張
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        <#code#>
    }
    

}
