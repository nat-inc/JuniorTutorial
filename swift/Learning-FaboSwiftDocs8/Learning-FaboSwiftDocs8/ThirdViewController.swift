//
//  ThirdViewController.swift
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

class ThirdViewController: UIViewController {

    // ⑤
    var InputStr: String!
    
    // 入力できる最大文字数
    let maxLength: Int = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Third View"
        self.view.backgroundColor = UIColor.green
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton_3 = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton_3.backgroundColor = UIColor.orange
        naviButton_3.layer.masksToBounds = true
        naviButton_3.layer.cornerRadius = 20.0
        naviButton_3.setTitle("Next", for: .normal)
        naviButton_3.addTarget(self, action: #selector(ThirdViewController.onClickNaviButton_3(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton_3)
        
        // ④
        let pwButton = UIButton(frame:CGRect(x:0, y:0, width: 200, height:50))
        pwButton.layer.position = CGPoint(x:self.view.frame.width/2, y:200)
        pwButton.layer.cornerRadius = 20.0
        pwButton.backgroundColor = UIColor.gray
        pwButton.setTitle("UIAlertを発動", for: .normal)
        pwButton.addTarget(self, action: #selector(ThirdViewController.onClickPwButton(sender:)), for: .touchUpInside)
        self.view.addSubview(pwButton)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ④
    // ボタンアクション時に設定するメソッド
    @objc internal func onClickPwButton(sender: UIButton) {
        
        // Alert生成
        let myAlert: UIAlertController = UIAlertController(title: "title", message: "6文字以下で入力", preferredStyle: UIAlertController.Style.alert)
        
        // OKアクション生成
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction!) -> Void in
            print("OK")
        }
        
        // Cancelアクション生成
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        
        // AlertにTextFieldを追加
        myAlert.addTextField{ (textField: UITextField!) -> Void in
            
            // 入力された文字を非表示に
            textField.isSecureTextEntry = true
            
            // NotificationCenterを生成
            let myNotificationCenter = NotificationCenter.default
            
            // textFieldに変更があればchangeTextFieldメソッドに通知
            myNotificationCenter.addObserver(self, selector: #selector(ThirdViewController.changeTextField(sender:)), name: UITextField.textDidChangeNotification, object:nil)
        }
        
        // Alertにアクションを追加
        myAlert.addAction(OKAction)
        myAlert.addAction(CancelAction)
        
        // Alertを発動
        present(myAlert, animated: true, completion: nil)
    }
    
    // ④
    // textFieldに変更があった際に通知されるメソッド
    @objc internal func changeTextField(sender: NSNotification) {
        let textField = sender.object as! UITextField
        
        // ⑤ 入力された文字を取得
        InputStr = textField.text
        
        // ⑤ 入力された文字が6文字を超えたら入力を制限
        if InputStr.count <= maxLength {
            textField.isEnabled = true
            
            // 入力された文字を表示
            print(textField.text!)
        } else {
            textField.isEnabled = false
            print("6文字を超えています")
        }
    }
    
    @objc internal func onClickNaviButton_3(sender: UIButton) {
        
        let fourthViewController = FourthViewController()
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }

}
