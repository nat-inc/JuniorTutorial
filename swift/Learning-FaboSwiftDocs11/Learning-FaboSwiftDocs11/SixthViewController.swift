//
//  SixthViewController.swift
//  Learning-FaboSwiftDocs11
//
//  Created by 小室沙央里 on 2022/09/12.
//
// ①UIImageで画像の透過(ViewController)
// ②UIImageをぼかす(SecondViewController)
// ③UIImageをリサイズする(ViewController)
// ④UIImageを合成する(ThirdViewController)
// ⑤UIViewからUIImageを取得する（スクリーンショット）(FourthViewController)
// ⑥UITextCheckerでスペルチェック(FifthViewController)
// ⑦UIViewにアタッチメントを適用させる(SixthViewController)
// ⑧UIViewに重力を適用させる(SixthViewController)
// ⑨UIViewをスナップさせる(SixthViewController)
// ⑩UIviewを動的に動かす(SixthViewController)

import UIKit

class SixthViewController: UIViewController {

    // ⑦、⑧
    // UIDynamicAnimatorのインスタンスを保存しなければアニメーションが実行されない
    var animator: UIDynamicAnimator!
    
    // ⑦
    var gravity: UIGravityBehavior!
    
    // ⑧
    var gravity_2: UIGravityBehavior!
    
    // ⑨
    var snapLabel: UILabel!
    var animator_2: UIDynamicAnimator!
    
    // ⑩
    var animoter_3: UIDynamicAnimator!
    var continuousPush: UIPushBehavior!
    var instantaneousPush: UIPushBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Fifth View"
        self.view.backgroundColor = UIColor.white

        // ⑦
        let myButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        myButton.layer.position = self.view.center
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.red, for: UIControl.State.highlighted) // 押した時の色
        myButton.backgroundColor = UIColor.cyan
        myButton.setTitle("Dropped!", for: UIControl.State.normal)
        myButton.addTarget(self, action: #selector(SixthViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(myButton)
        
        // myButtonを繋ぐスプリング作成
        let springView = UIView(frame: CGRect(x:0, y:0, width: 5, height: 50))
        springView.layer.position = self.view.center
        springView.backgroundColor = UIColor.brown
        self.view.addSubview(springView)
        
        // UIDynamicAnimatorの生成とインスタンスの保存
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // 重力を生成してButtonに付随させる
        gravity = UIGravityBehavior(items: [myButton])
        
        //アタッチ作成
        let attach = UIAttachmentBehavior(item: myButton, attachedToAnchor: self.view.center)
        
        // 減衰値(止まるまでの時間)
        attach.damping = 0.01
        
        // 振幅(振る回数)
        attach.frequency = 1.0
        
        // ヒモの長さ
        attach.length = 100
        
        // アニメーションが動いてる際に呼ばれるブロック文を設定
        attach.action = {
            var rect = springView.frame
            rect.size.height = myButton.frame.origin.y - rect.origin.y
            springView.frame = rect
        }
        
        // UIDynamicAnimatorにアタッチを追加
        animator.addBehavior(attach)
        
        // ⑧
        let myLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 40))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.text = "Hello Swift!"
        myLabel.textColor = UIColor.white
        myLabel.layer.contents = 20.0
        myLabel.shadowColor = UIColor.gray
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 300)
        self.view.addSubview(myLabel)

        let myButton_2 = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 40))
        myButton_2.layer.position = CGPoint(x: self.view.frame.width/2, y: 500)
        myButton_2.layer.masksToBounds = true
        myButton_2.layer.cornerRadius = 20.0
        myButton_2.backgroundColor = UIColor.green
        myButton_2.setTitle("DROPPED", for: UIControl.State.normal)
        myButton_2.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton_2.setTitleColor(UIColor.red, for: UIControl.State.highlighted)
        myButton_2.addTarget(self, action: #selector(SixthViewController.onClickMyButton_2(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(myButton_2)

        gravity_2 = UIGravityBehavior(items:[myLabel])

        // Collisionを作成、Viewに適用させる
        let collision = UICollisionBehavior(items: [myLabel])

        // 透明な四角形の当たり判定を作る
        collision.addBoundary(

            // Identifiew
            withIdentifier: "barrier" as NSCopying,

            // UIBezierPathで四角形の図形を作る
            for: UIBezierPath(rect:
                                CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: self.view.frame.maxX, height: 10)))

        animator.addBehavior(collision)
        
        // ⑨
        snapLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 40))
        snapLabel.backgroundColor = UIColor.blue
        snapLabel.layer.cornerRadius = 20.0
        snapLabel.layer.masksToBounds = true
        snapLabel.text = "snap!!"
        snapLabel.textColor = UIColor.white
        snapLabel.textAlignment = NSTextAlignment.center
        snapLabel.shadowColor = UIColor.gray
        snapLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        self.view.addSubview(snapLabel)
        
        animator_2 = UIDynamicAnimator(referenceView: self.view)
        
        // ⑩
        // continuousButton作成
        let continuousButton = UIButton(frame:CGRect(x:0, y:0, width: 200, height:50))
        continuousButton.layer.position = CGPoint(x: self.view.center.x, y: 600)
        continuousButton.layer.masksToBounds = true
        continuousButton.layer.cornerRadius = 20.0
        continuousButton.setTitle("Continuous!", for: UIControl.State.normal)
        continuousButton.backgroundColor = UIColor.orange
        continuousButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        continuousButton.setTitleColor(UIColor.yellow, for: UIControl.State.highlighted)
        continuousButton.addTarget(self, action: #selector(SixthViewController.onClickMyButton_3(sender:)), for: UIControl.Event.touchUpInside)
        continuousButton.tag = 1
        self.view.addSubview(continuousButton)
        
        // instaneousButton作成
        let instaneousButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height:50))
        instaneousButton.layer.position = CGPoint(x: self.view.center.x, y: 700)
        instaneousButton.layer.masksToBounds = true
        instaneousButton.layer.cornerRadius = 20.0
        instaneousButton.setTitle("Instaneous!", for: UIControl.State.normal)
        instaneousButton.backgroundColor = UIColor.red
        instaneousButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        instaneousButton.setTitleColor(UIColor.yellow, for: UIControl.State.highlighted)
        instaneousButton.addTarget(self, action: #selector(SixthViewController.onClickMyButton_3(sender:)), for: UIControl.Event.touchUpInside)
        instaneousButton.tag = 2
        self.view.addSubview(instaneousButton)
        
        animoter_3 = UIDynamicAnimator(referenceView: self.view)
        
        // UIViewを等加速度運動で動かすUIPushBehaviorを生成
        continuousPush = UIPushBehavior(items: [continuousButton], mode: UIPushBehavior.Mode.continuous)
        continuousPush.pushDirection = CGVector(dx: 0.0, dy: 1.0)
        
        // UIViewを等速運動で動かすUIPushBehaviorを生成
        instantaneousPush = UIPushBehavior(items: [instaneousButton], mode: UIPushBehavior.Mode.instantaneous)
        instantaneousPush.pushDirection = CGVector(dx: 0.0, dy: 1.0)
        
    }
    
    // ⑦
    @objc func onClickMyButton(sender: UIButton) {
        
        // UIDynamicAnimatorに重力を追加
        animator.addBehavior(gravity)
    }
    
    // ⑧
    @objc func onClickMyButton_2(sender: UIButton) {
        
        // gravity_2のアニメーションを実行
        animator.addBehavior(gravity_2)
    }

    // ⑨
    // タップを感知したときに呼ばれるメソッド
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            // タッチされた座標を取得
            let location = touch.location(in: self.view)
            
            // animatorに登録されていたBahaviorを全て削除
            animator_2.removeAllBehaviors()
            
            // UIViewをスナップさせるUISnapBehaviorを生成
            let snap = UISnapBehavior(item: snapLabel, snapTo: location)
            
            // スナップを適用
            animator_2.addBehavior(snap)
        }
        
    }
    
    // ⑩
    @objc func onClickMyButton_3(sender: UIButton) {
        
        switch(sender.tag) {
        case 1:
            animoter_3.addBehavior(continuousPush)
            
        case 2:
            animoter_3.addBehavior(instantaneousPush)
            
        default:
            print("Error")
        }
    }
}
