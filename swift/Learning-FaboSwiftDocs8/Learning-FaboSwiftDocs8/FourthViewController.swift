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
// ⑦UITableViewをSlideさせる(FifthViewController)
// ⑧UITableViewに追加・削除機能を追加(SixthViewController)

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
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton_4 = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton_4.backgroundColor = UIColor.orange
        naviButton_4.layer.masksToBounds = true
        naviButton_4.layer.cornerRadius = 20.0
        naviButton_4.setTitle("Next", for: .normal)
        naviButton_4.addTarget(self, action: #selector(FourthViewController.onClickNaviButton_4(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton_4)
        
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
        cell.textLabel?.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    // Buttonを拡張(UITableViewRowActionは、ios13.0〜非推奨、UIContextualActionを使う)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) ->  UISwipeActionsConfiguration? {
        
        // シェアのアクションを設定
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
//                                                                                                 completion(true).self
            tableView.isEditing = false
            print("share")
        })
            
            shareAction.backgroundColor = UIColor.blue
        
        let archiveAction = UIContextualAction(style: .normal, title: "Archive", handler: {(action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
//                                                                                                 completion(true).self
            tableView.isEditing = false
            print("archive")
        })
            
        archiveAction.backgroundColor = UIColor.red

        return UISwipeActionsConfiguration(actions: [shareAction, archiveAction])
    }
    
    @objc internal func onClickNaviButton_4(sender: UIButton) {
        
        let fifthViewController = FifthViewController()
        self.navigationController?.pushViewController(fifthViewController, animated: true)
    }
}

