//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs6
//
//  Created by 小室沙央里 on 2022/08/31.
//  ①セクション分けしたUITableViewを作る
//  ②UITextFieldに文字数制限を設ける
//  ③UITextFieldの入力をパスワード形式にする
//  ④UIBarButtonItemの追加
//  ⑤UISearchBarの表示
//  ⑥UIProgressViewで進捗の具合の確認
//  ⑦UINavigationControllerの表示
//  ⑧UIWindowの表示

import UIKit

class SecondViewController: UIViewController {
    
    // ⑧
    private var myWindow: UIWindow!
    private var myWindowButton: UIButton!
    private var myButton2: UIButton!
//    private var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Second Navigation"
        self.view.backgroundColor = UIColor.blue
        
        // ⑧
        myWindow = UIWindow()
        myWindowButton = UIButton()
        myButton2 = UIButton()
        
        // 背景に画像を設定
        let myImage: UIImage = UIImage(named: "IMG_7572.jpeg")!
        let myImageView: UIImageView = UIImageView()
        myImageView.image = myImage
        
        // 画像のScaleを計算
        let scale = self.view.frame.width/myImage.size.width
        myImageView.frame = CGRect(x:0, y:0, width: myImage.size.width*scale, height: myImage.size.height*scale)
        self.view.addSubview(myImageView)
        
        myButton2.frame = CGRect(x:0, y:0, width: 80, height: 80)
        myButton2.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height-100)
        myButton2.backgroundColor = UIColor.cyan
        myButton2.layer.masksToBounds = true
        myButton2.layer.cornerRadius = 30.0
        myButton2.setTitle("Location", for: .normal)
        myButton2.setTitleColor(UIColor.white, for: .normal)
        myButton2.addTarget(self, action: #selector(SecondViewController.onClickMyButton2(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton2)
        
    }
    
    // 自作Windowを作成
    internal func makeMyWindow() {
        
        myWindow.backgroundColor = UIColor.white
        myWindow.frame = CGRect(x:0, y:0, width: 200, height: 250)
        myWindow.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        myWindow.alpha = 0.8
        myWindow.layer.cornerRadius = 20
        
        // myWindowをkeyWindowにする
        myWindow.makeKey()
        
        // Windowを表示する
        self.myWindow.makeKeyAndVisible()
        
        // Closeボタンを生成
        myWindowButton.frame = CGRect(x:0, y:0, width: 100, height: 60)
        myWindowButton.layer.position = CGPoint(x:self.myWindow.frame.width/2, y:self.myWindow.frame.height-50)
        myWindowButton.setTitle("Close", for: .normal)
        myWindowButton.setTitleColor(UIColor.white, for: .normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 20.0
        myWindowButton.addTarget(self, action: #selector(SecondViewController.onClickMyButton2(sender:)), for: .touchUpInside)
        self.myWindow.addSubview(myWindowButton)
        
        // TextViewを生成
        let myTextView:UITextView = UITextView(frame: CGRect(x:10, y:10, width:self.myWindow.frame.width - 20, height: 150))
        myTextView.backgroundColor = UIColor.clear
        myTextView.text = "Santa Barbara"
        myTextView.font = UIFont.systemFont(ofSize: 15.0)
        myTextView.textColor = UIColor.black
        myTextView.textAlignment = NSTextAlignment.left
        myTextView.isEditable = false
        
        self.myWindow.addSubview(myTextView)
        
    }

    @objc internal func onClickMyButton2(sender: UIButton) {
        
        if sender == myWindowButton {
            myWindow.isHidden = true
        }
        else if sender == myButton2 {
            makeMyWindow()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
