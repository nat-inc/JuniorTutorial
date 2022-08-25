//
//  ViewController.swift
//  Learning-FaboSwiftDocs3
//
//  Created by 小室沙央里 on 2022/08/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Controllerのタイトルを設定
        self.title = "My First View"
        
        // Viewの背景色を定義
        self.view.backgroundColor = UIColor.cyan
        
        //ボタン
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let poyY: CGFloat = 200
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("ボタン", for: .normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        myButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchUpInside)
        
        // ボタンをViewに追加する
        self.view.addSubview(myButton)
    }

    @objc internal func onClickMyButton(sender: UIButton) {
        
        // 移動先のViewを定義
        let secondViewController = SecondViewController()
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


