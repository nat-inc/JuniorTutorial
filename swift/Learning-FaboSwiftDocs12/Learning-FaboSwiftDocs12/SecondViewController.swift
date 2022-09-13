//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs12
//
//  Created by 小室沙央里 on 2022/09/13.
//

import UIKit

class SecondViewController: UIViewController {

    var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Second View"
        self.view.backgroundColor = UIColor.white
        
        myLabel = UILabel(frame: CGRect(x:0, y:0, width: 80, height: 80))
        myLabel.text = "Drag!"
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.backgroundColor = UIColor.red
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 40.0
        myLabel.center = self.view.center
        
        self.view.addSubview(myLabel)
        
        let modalButton = UIButton()
        modalButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        modalButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        modalButton.backgroundColor = UIColor.green
        modalButton.layer.masksToBounds = true
        modalButton.layer.cornerRadius = 20.0
        modalButton.setTitle("ボタン", for: .normal)
        modalButton.addTarget(self, action: #selector(SecondViewController.onClickModalButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(modalButton)
    }
    
    // タッチを感知したときに呼ばれるメソッド
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
        // Labelアニメーション
        UIView.animate(withDuration: 0.06,
                       animations:{() -> Void in
            
            // 縮小用アフィン行列を作成する
            self.myLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        {(Bool) -> Void in
        }
    }

    // ドラッグを感知した際に呼ばれるメソッド(ドラッグ中何度も呼ばれる)
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        
        // タッチイベントを取得
        let aTouch: UITouch = touches.first!
        
        // 移動した先の座標を取得
        let location = aTouch.location(in: self.view)
        
        // 移動する前の座標を取得
        let prevLocation = aTouch.previousLocation(in: self.view)
        
        // CGRect生成
        var myFrame: CGRect = self.view.frame
        
        // ドラッグで移動したx, y距離をとる
        let deltaX: CGFloat = location.x - prevLocation.x
        let deltaY: CGFloat = location.y - prevLocation.y
        
        // 移動した分の距離をmyFrameの座標にプラス
        myFrame.origin.x += deltaX
        myFrame.origin.y += deltaY
        
        // frameにmyFrameを追加
        self.view.frame = myFrame
    }
    
    // 指が離れたことを感知した際に呼ばれるメソッド
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        
        // Labelアニメーション
        UIView.animate(withDuration: 0.1,
                       animations: {() -> Void in
            // 拡大用アフィン行列作成
            self.myLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            
            // 縮小用アフィン行列作成
            self.myLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        {(Bool) -> Void in
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func onClickModalButton(sender: UIButton) {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
