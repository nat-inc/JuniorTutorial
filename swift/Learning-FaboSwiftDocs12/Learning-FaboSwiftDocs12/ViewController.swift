//
//  ViewController.swift
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
import WebKit

class ViewController: UIViewController {
    
    // ①
    var mainButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.backgroundColor = UIColor.white

        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-100)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(ViewController.onClickNaviButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(naviButton)
        
        mainButton = UIButton(frame: CGRect(x:0, y:0, width: 100, height: 100))
        mainButton.center = self.view.center
        
        let myCusButton: MyCustomButton = MyCustomButton(frame:CGRect(x:0, y:0, width: self.view.bounds.width, height: self.view.bounds.height-200))
        myCusButton.mainButton = self.mainButton
        myCusButton.mainPosition = self.mainButton.layer.position
        self.view.addSubview(myCusButton)
        
        mainButton.layer.masksToBounds = true
        mainButton.layer.cornerRadius = 50.0
        mainButton.backgroundColor = UIColor.red
        mainButton.setTitleColor(UIColor.white, for: .normal)
        mainButton.setTitle("Fire!", for: .normal)
        mainButton.tag = 0
        mainButton.addTarget(myCusButton, action: #selector(myCusButton.onDownMainButton(sender:)), for: UIControl.Event.touchUpInside)
        mainButton.addTarget(myCusButton, action: #selector(myCusButton.onUpMainButton(sender:)), for: [.touchUpInside, .touchDragInside])
        
        self.view.addSubview(mainButton)
        
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
