//
//  SixthViewController.swift
//  Learning-FaboSwiftDocs8
//
//  Created by 小室沙央里 on 2022/09/07.
//
// ①UIViewにトランジションをつける(ViewController)
// ②タッチイベントの有効/無効を切り替える(ViewController)
// ③GestureRecognizerのイベント取得(SecondViewController)
// ④UIAlertControllerをパスワード形式にする(ThirdViewController)
// ⑤UIAlertControllerで文字数制限を設ける（ThirdViewController）
// ⑥TableViewのボタンの拡張(FourthViewController)
// ⑦UITableViewをSlideさせる(FifthViewController)
// ⑧UITableViewに追加・削除機能を追加(SixthViewController)

import UIKit

class SixthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let myItems_2: NSMutableArray = ["Cell1", "Cell2", "Cell3"]
    var myTableView_2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Sixth View"
        self.view.backgroundColor = UIColor.white
        
        // ナビゲーションバーを取得
        self.navigationController?.navigationBar
        
        // ナビゲーションバーを表示
        self.navigationController?.isNavigationBarHidden = false
        
        // ナビゲーションバーの右側に編集ボタンを追加
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView_2 = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView_2.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell_2")
        myTableView_2.dataSource = self
        myTableView_2.delegate = self
        
        // 罫線を青色に設定
        myTableView_2.separatorColor = UIColor.blue
        
        // 編集中のセル選択を許可
        myTableView_2.allowsSelectionDuringEditing = true
        
        self.view.addSubview(myTableView_2)
    }
    
    // Cellが選択された際に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択中のセルが何番目か
        print("Num:\(indexPath.row)")
        
        //選択中のセルのValue
        print("Value:\(myItems_2[indexPath.row])")
        
        //選択中のセルを編集できるか
        print("Editing:\(tableView.isEditing)")
    }
    
    // Cellの総数を返す（実装必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems_2.count
    }
    
    // Cellに値を設定（実装必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell_2", for: indexPath as IndexPath)
        
        cell.textLabel?.text = "\(myItems_2[indexPath.row])"
        
        return cell
    }
    
    // 編集ボタンが押された際に呼び出される
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // TableViewを編集可能にする
        myTableView_2.setEditing(editing, animated: true)
        
        // 編集中の時のみaddButtonをナビゲーションバーの左に表示
        if editing {
            print("編集中")
            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(SixthViewController.addCell(sender:)))
            self.navigationItem.setLeftBarButton(addButton, animated: true)
        } else {
            print("通常モード")
            self.navigationItem.setLeftBarButton(nil, animated: true)
        }
    }
    
    // addButtonが押された際に呼び出される
    @objc func addCell(sender: AnyObject) {
        print("追加")
        
        // myItemsに追加
        myItems_2.add("add Cell")
        
        // TableViewを再読み込み
        myTableView_2.reloadData()
    }
    
    // Cellを挿入または削除しようとした際に呼び出される
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 削除の時
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("削除")
            
            // 指定されたセルのオブジェクトをmyItemsから削除する
            myItems_2.removeObject(at: indexPath.row)
            
            myTableView_2.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
