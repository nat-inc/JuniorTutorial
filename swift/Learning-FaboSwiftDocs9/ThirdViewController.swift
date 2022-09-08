//
//  ThirdViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/08.
//
// ①セカンドScreenへの描画(ViewController)　※iPhoneの実機buildできないため実装未確認（iPadはできる）
// ②周期の違うUIScrollViewを同期させる(SecondViewController)
// ③プルンプルンするButtonの作成(ThirdViewController)
// ④カスタマイズButton(ThirdViewController, MyButton_2)
// ⑤UIパーツの削除(FourthViewControllew)

import UIKit

class ThirdViewController: UIViewController {
    
    var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Third View"
        self.view.backgroundColor = UIColor.blue
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0121112
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(ThirdViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        // ③
        myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width: 100, height: 100)
        myButton.layer.masksToBounds = true
        myButton.backgroundColor = UIColor.green
        myButton.layer.cornerRadius = 50.0
        myButton.setTitle("ボタン", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        // TouchDown時のイベント追加
        myButton.addTarget(self, action: #selector(ThirdViewController.onDownButton(sender:)), for: .touchDown)
        
        // TouchUp時のイベント追加
        myButton.addTarget(self, action: #selector(ThirdViewController.onUpButton(sender:)), for: [.touchUpInside, .touchUpOutside])
        
        self.view.addSubview(myButton)
        
        // ④
        let myButton_2 = MyButton_2(frame: CGRect(x:50, y:50, width: 100, height: 100))
        myButton_2.setTitle("ボタン2", for: UIControl.State.normal)
        myButton_2.setTitleColor(UIColor.black, for: UIControl.State.normal)
        myButton_2.addTarget(self, action: #selector(ThirdViewController.onClickMyButton_2(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton_2)
        
        // Do any additional setup after loading the view.

    }
    
    // ③
    // ボタンイベント(Down)
    @objc func onDownButton(sender: UIButton) {
        // UIView.animateWithDuration
        UIView.animate(withDuration: 0.06,
                       
                       // アニメーション中の処理
                       animations: { () -> Void in
            
            // 縮小用アフィン行列を作成(変化する大きさを設定)
            self.myButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        { (Bool) -> Void in
            
        }
    }
    
    // ボタンイベント(Up)
    @objc func onUpButton(sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       
                       // アニメーション中の処理
                       animations: { () -> Void in
            
            // 拡大用アフィン行列を作成(変化する大きさを設定)
            self.myButton.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            
            // 縮小用アフィン行列を作成(変化する大きさを設定)
            self.myButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        })
        { (Bool) -> Void in
            
        }
    }
    
    // ④
    @objc func onClickMyButton_2(sender: UIButton) {
        print("onClickMyButton_2")
        print("sender.currentTitle: \(sender.currentTitle!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let fourthViewController = FourthViewController()
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }

}
