//
//  ThirdViewController.swift
//  Learning-FaboSwiftDocs12
//
//  Created by 小室沙央里 on 2022/09/13.
//
// ①一つのボタンから複数のボタンが飛び出す(ViewController, MyCustomButton)
// ②ドラッグでViewを移動させる(SecondViewController)
// ③モーダル表示させる(SecondViewController, ThirdViewController)
// ④現Viewの上に別Viewを表示する(FourthViewController)
// ⑤UIViewに当たり判定を適用させる(ThirdViewController)
// ⑥UIPopoverControllerを使ってViewをポップさせる(iPad専用)(FourthViewController)

import UIKit

class ThirdViewController: UIViewController {
    
    // ⑤
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Third View"
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        
        // 戻るボタン生成
        let backButton = UIButton()
        backButton.frame = CGRect(x:0, y:0, width: 200, height: 40)
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 20.0
        backButton.backgroundColor = UIColor.red
        backButton.setTitle("もどる", for: UIControl.State.normal)
        backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        backButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        backButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 100)
        backButton.addTarget(self, action: #selector(ThirdViewController.onClickBackButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(backButton)
        
        // ⑤
        let myLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 40))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Swift!"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: -200)
        myLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(myLabel)
        
        // 障害物作成
        let myBoxView = UIView(frame: CGRect(x:0, y:0, width: 50, height: 40))
        myBoxView.backgroundColor = UIColor.blue
        myBoxView.layer.masksToBounds = true
        myBoxView.layer.position = CGPoint(x: self.view.frame.midX - 50, y: self.view.frame.midY)
        self.view.addSubview(myBoxView)
        
        // DropButton作成
        let myButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        myButton.layer.position = CGPoint(x: self.view.frame.midX, y: 500)
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("Dropped!", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        myButton.backgroundColor = UIColor.red
        myButton.addTarget(self, action: #selector(ThirdViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        myButton.tag = 0
        self.view.addSubview(myButton)
        
        // ResetButton作成
        let ResetButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        ResetButton.layer.position = CGPoint(x: self.view.frame.midX,y: 400)
        ResetButton.layer.masksToBounds = true
        ResetButton.layer.cornerRadius = 20.0
        ResetButton.setTitle("Reset!", for: UIControl.State.normal)
        ResetButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        ResetButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        ResetButton.backgroundColor = UIColor.blue
        ResetButton.addTarget(self, action: #selector(ThirdViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        ResetButton.tag = 1
        self.view.addSubview(ResetButton)
        
        // UIDynamicAnimatorの生成とインスタンスの保存
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // 重力を作り、Viewに適用させる
        gravity = UIGravityBehavior(items: [myLabel])
        
        // Collisionを作成、Viewに適用させる
        let collision = UICollisionBehavior(items: [myLabel, myBoxView])
        
        // Collisionの挙動指定
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: myBoxView.frame))
        
        // Collisionのアニメーション実行
        animator.addBehavior(collision)
    }
    
    @objc func onClickMyButton(sender: UIButton) {
        
        switch(sender.tag) {
            
            // DropButton
        case 0:
            // Gravityのアニメーション実行
            animator.addBehavior(gravity)
            
            // ResetButton
        case 1:
            let next = ThirdViewController()
            self.present(next, animated: false, completion: nil)
            
        default:
            print("error!")
        }
    }
    
    
    @objc func onClickBackButton(sender: UIButton) {
        
        // Viewを閉じる
        self.dismiss(animated: true, completion: nil)
        
//        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
