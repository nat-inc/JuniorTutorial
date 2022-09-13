//
//  SeventhViewController.swift
//  Learning-FaboSwiftDocs11
//
//  Created by 小室沙央里 on 2022/09/13.
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
// 11. UIViewアニメーションまとめ(SeventhViewController)

import UIKit

class SeventhViewController: UIViewController {

    var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Seventh View"
        self.view.backgroundColor = UIColor.white

        // 11
        myLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 50))
        myLabel.backgroundColor = UIColor(red: 0.561, green: 0.737, blue: 0.561, alpha: 1.0)
        myLabel.center = self.view.center
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.textColor = UIColor.white
        self.view.addSubview(myLabel)
        
        // SegmentController生成
        let mySegcon = UISegmentedControl(items: ["Spring", "Invert", "Rotate", "Scaling", "Move"])
        mySegcon.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blue
        mySegcon.addTarget(self, action: #selector(SeventhViewController.changedValue(sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(mySegcon)
 
    }
    
    // SegmentControllerの値が変わったときに呼ばれるメソッド
    @objc func changedValue(sender: UISegmentedControl) {
        
        myLabel.center = self.view.center
        
        // 各アニメーションの処理
        switch(sender.selectedSegmentIndex) {
         
            // バネの動きをするアニメーション
        case 0:
            UIView.animate(withDuration: 2.0,  // アニメーションの時間を2秒に設定
                           
                           delay: 0.0,  // 遅延時間
                           
                           usingSpringWithDamping: 0.2,  // バネの弾性力。小さいほど弾性力は大きくなる
                           
                           initialSpringVelocity: 1.5,  // 初速度
                           
                           animations: {() -> Void in
                
                self.myLabel.layer.position = CGPoint(x: self.view.frame.width - 50, y: 100)
    
                // アニメーション完了時の処理
            }) {(Bool) -> Void in
                self.myLabel.center = self.view.center
            }
            
            // X, Y方向にそれぞれ反転するアニメーション
        case 1:
            UIView.animate(withDuration: 3.0,
                           
                           // アニメーション中の処理
                           animations: {() -> Void in
                
                // X方向に反転用のアフィン行列作成
                self.myLabel.transform = self.myLabel.transform.scaledBy(x: -1.0, y: 1.0)
            }) {(Bool) -> Void in
                UIView.animate(withDuration: 3.0,
                               animations:{ () -> Void in
                    
                // Y方向に反転用のアフィン行列作成
                self.myLabel.transform = self.myLabel.transform.scaledBy(x: 1.0, y: -1.0)
                
                // アニメーション完了時の処理
            }) {(Bool) -> Void in
            }
        }
        
        // 回転アニメーション
        case 2:
        // 初期化
            self.myLabel.transform = CGAffineTransform(rotationAngle: 0)
        
            // radianで回転角度を指定(90度)
            let angle: CGFloat = CGFloat(Double.pi/2)
            
            // アニメーションの秒数を設定(3秒)
            UIView.animate(withDuration: 3.0,
                           animations: {() -> Void in
                
                // 回転用のアフィン行列作成
                self.myLabel.transform = CGAffineTransform(rotationAngle: angle)
            },
                           completion: {(Bool) -> Void in
            })
            
            // 拡縮アニメーション
        case 3:
            self.myLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            UIView.animate(withDuration: 3.0,
                           animations: {() -> Void in
                
                // 縮小用アフィン行列作成
                self.myLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) // 連続したアニメーション処理
            {(Bool) -> Void in
                UIView.animate(withDuration: 3.0,
                               animations: {() -> Void in
                    
                    // 拡大用アフィン行列作成
                    self.myLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                })
                // アニメーション完了時の処理
                {(Bool) -> Void in
                    // 大きさを元に戻す
                    self.myLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
            
            // 移動するアニメーション
        case 4:
            myLabel.layer.position = CGPoint(x: -30, y: 30)
            
            // アニメーション処理
            UIView.animate(withDuration: TimeInterval(CGFloat(3.0)),
                           animations: {() -> Void in
                
                // 移動先の座標を指定
                self.myLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
                
            }, completion: {(Bool) -> Void in
            })
            
        default:
            print("error!")
        }
    }

    override func  didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
