//
//  FourthViewController.swift
//  Learning-FaboSwiftDocs12
//
//  Created by 小室沙央里 on 2022/09/14.
//
// ①一つのボタンから複数のボタンが飛び出す(ViewController, MyCustomButton)
// ②ドラッグでViewを移動させる(SecondViewController)
// ③モーダル表示させる(SecondViewController, ThirdViewController)
// ④現Viewの上に別Viewを表示する(FourthViewController)
// ⑤UIViewに当たり判定を適用させる(ThirdViewController)
// ⑥UIPopoverControllerを使ってViewをポップさせる(iPad専用)(FourthViewController)

import UIKit

class FourthViewController: UIViewController {

    // ④
    var myView: UIView!
    var myButton: UIButton!
    var flag: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fourth View"
        self.view.backgroundColor = UIColor.white
        
        // ④
        // view表示・非表示のためのフラグ
        flag = false
        
        // Viewを生成
        myView = UIView(frame: CGRect(x:0, y:0, width: 100, height: 100))
        
        myView.backgroundColor = UIColor.green
        myView.alpha = 0.5
        
        // 位置を中心に設定
        myView.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        // myViewを非表示
        myView.isHidden = true
        
        myButton = UIButton(frame: CGRect(x:0, y:0, width: 100, height: 50))
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2-200)
        myButton.setTitle("Appear", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.addTarget(self, action: #selector(FourthViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(myView)
        self.view.addSubview(myButton)
        
        // ⑥
        let popButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        popButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-300)
        popButton.layer.masksToBounds = true
        popButton.layer.cornerRadius = 20.0
        popButton.setTitle("Present!", for: UIControl.State.normal)
        popButton.backgroundColor = UIColor.orange
        popButton.addTarget(self, action: #selector(FourthViewController.onClickPopButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(popButton)
        
    }
    
    // ④
    // ボタンイベント
    @objc func onClickMyButton(sender: UIButton) {
        
        // flagがfalseならmyViewを表示
        if !flag {
            // myViewを表示
            myView.isHidden = false
            
            // ボタンのタイトルを変更
            myButton.setTitle("Disappear", for: .normal)
            flag = true
        }
        // flagがtrueならmyViewを非表示
        else {
            
            myView.isHidden = true
            
            myButton.setTitle("Appear", for: .normal)
            flag = false
        }
    }
    
    // ⑥
    // popButtonメソッド
    @objc func onClickPopButton(sender: UIButton) {
        
        // コンテンツのViewControllerを生成
        let popover = UIViewController()
        
        // コンテンツViewControllerのサイズを指定.
        popover.preferredContentSize = CGSize(width: 200, height: 200)
        
        popover.view.backgroundColor = UIColor.blue
        popover.modalPresentationStyle = .popover
        
        if let presentationController = popover.popoverPresentationController {
            presentationController.permittedArrowDirections = .any
            presentationController.sourceView = sender
            presentationController.sourceRect = sender.bounds
        }
        
        present(popover, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
