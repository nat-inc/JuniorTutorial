//
//  ViewController.swift
//  Learning-FaboSwiftDocs2
//
//  Created by 小室沙央里 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        
        //ボタン生成
        let nextButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        nextButton.backgroundColor = UIColor.red
        nextButton.layer.masksToBounds = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 20.0
        nextButton.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
        nextButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
    }


    @objc internal func onClickMyButton(sender: UIButton) {
        
        //遷移するViewを定義する
        let mySecondViewController: UIViewController = SecondViewController()
        
        //アニメーションを設定する
        mySecondViewController.modalTransitionStyle = .partialCurl
        
        //Viewの移動する
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


