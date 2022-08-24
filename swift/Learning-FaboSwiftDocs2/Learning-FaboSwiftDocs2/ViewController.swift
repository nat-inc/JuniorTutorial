//
//  ViewController.swift
//  Learning-FaboSwiftDocs2
//
//  Created by 小室沙央里 on 2022/08/22.

// ①UIAlertControllerでアラートを表示
// ②UIPickerViewで値の選択
// ③ViewControllerで画面遷移する

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        
        //Nextボタン生成
        let nextButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        nextButton.backgroundColor = UIColor.red
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
        nextButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        
        //①Alertボタン生成
        let myButton: UIButton = UIButton()
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 40
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let poyY: CGFloat = 200
        myButton.frame = CGRect(x: posX, y: poyY, width: buttonWidth, height: buttonHeight)
        myButton.backgroundColor = UIColor.blue
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("UIAlertを発動", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.addTarget(self, action: #selector(onClickAlertButton(sender:)), for: .touchDown)
        
        self.view.addSubview(myButton)
    }
    
    //画面遷移イベント　（modalPresentationStyleの指定でフルスクリーンに変更）
    @objc internal func onClickMyButton(sender: UIButton) {
        //遷移するViewを定義する
        let mySecondViewController: UIViewController = SecondViewController()
        
        //アニメーションを設定する
        mySecondViewController.modalPresentationStyle = .fullScreen
        
        //Viewの移動する
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    
    //①アラートイベント
    @objc internal func onClickAlertButton(sender: UIButton) {
        
        // UIAlertControllerを作成
        let myAlert: UIAlertController = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        
        // OKのアクションを作成
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("OK!!")
        }
        
        // OKのActionを追加
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動
        present(myAlert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


