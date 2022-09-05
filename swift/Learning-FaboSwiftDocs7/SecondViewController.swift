//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs7
//
//  Created by 小室沙央里 on 2022/09/02.
// ①UIToolBarの表示
// ②UISegmentedControlの表示
// ③UIStepperの表示
// ④UINavigationItemでUINavigationBarを設定
// ⑤UIAlertControllerでActionSheet表示
// ⑥UIMenuControllerにMenuItemを追加
// ⑦UIViewにBlurエフェクトを適用させる
// ⑧UIViewにUIMotionEffectを追加--?--

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // ⑤
    override func viewDidAppear(_ animated: Bool) {
        let myAlert = UIAlertController(title: "タイトル", message: "message", preferredStyle: UIAlertController.Style.actionSheet)
        let myAction_1 = UIAlertAction(title:"Hello", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            print("Hello")
        })
        
        let myAction_2 = UIAlertAction(title:"yes", style: UIAlertAction.Style.destructive, handler: {
            (action: UIAlertAction!) in
            print("yes")
        })
        
        let myAction_3 = UIAlertAction(title: "no", style: UIAlertAction.Style.cancel, handler: {
            (action: UIAlertAction!) in
            print("no")
        })
        
        // アクションを追加
        myAlert.addAction(myAction_1)
        myAlert.addAction(myAction_2)
        myAlert.addAction(myAction_3)
        
        //--------------------iPadのクラッシュを防ぐために必須-------------
        myAlert.popoverPresentationController?.sourceView = self.view
        let screenSize = UIScreen.main.bounds
        myAlert.popoverPresentationController?.sourceRect = CGRect(x: screenSize.size.width/2, y: screenSize.size.height, width: 0, height: 0)
        //--------------------iPadのクラッシュを防ぐために必須-------------
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        self.title = "Second View"
        
        // ⑥
        let myTextField: UITextField = UITextField(frame: CGRect(x:0, y:0, width: 200, height: 30))
        myTextField.text = "Hello Swift!"
        myTextField.delegate = self
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        
        self.view.addSubview(myTextField)
        
        // MenuController生成
        let myMenuController: UIMenuController = UIMenuController.shared
        
        // MenuControllerを表示
        myMenuController.isMenuVisible = true
        
        // 矢印の向きを下に設定
        myMenuController.arrowDirection = UIMenuController.ArrowDirection.down
        
        // rect、viewを設定
        myMenuController.setTargetRect(CGRect.zero, in: self.view)
        // Do any additional setup after loading the view.
        
        let myMenuItem_1: UIMenuItem = UIMenuItem(title: "Menu1", action: #selector(SecondViewController.onMenu1(sender:)))
        let myMenuItem_2: UIMenuItem = UIMenuItem(title: "Menu2", action: #selector(SecondViewController.onMenu2(sender:)))
        let myMenuItem_3: UIMenuItem = UIMenuItem(title: "Menu3", action: #selector(SecondViewController.onMenu3(sender:)))
       
        let myMenuItems: NSArray = [myMenuItem_1, myMenuItem_2, myMenuItem_3]
        
        
        myMenuController.menuItems = myMenuItems as? [UIMenuItem]
        
        // Naviボタン
        let naviButton_2 = UIButton(frame:CGRect(x:0, y:0, width:100, height:50))
        naviButton_2.backgroundColor = UIColor.orange
        naviButton_2.layer.position = CGPoint(x:self.view.bounds.width*2/3, y:330)
        naviButton_2.layer.masksToBounds = true
        naviButton_2.layer.cornerRadius = 20.0
        naviButton_2.setTitle("進む", for: .normal)
        naviButton_2.addTarget(self, action: #selector(SecondViewController.onClickNaviButton_2(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton_2)
        
        let naviButtonback = UIButton(frame:CGRect(x:0, y:0, width:100, height:50))
        naviButtonback.backgroundColor = UIColor.orange
        naviButtonback.layer.position = CGPoint(x:self.view.bounds.width*1/3, y:330)
        naviButtonback.layer.masksToBounds = true
        naviButtonback.layer.cornerRadius = 20.0
        naviButtonback.setTitle("戻る", for: .normal)
        naviButtonback.addTarget(self, action: #selector(SecondViewController.onClickNaviButton_3(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButtonback)
    }
    
    // ⑥
    // UITextFieldが編集開始された直後に呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing:" + textField.text!)
    }

    // UITextFieldが編集終了する直前に呼ばれる
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    
    // 作成したMenuItemが表示されるようにする
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(SecondViewController.onMenu1(sender:)) || action == #selector(SecondViewController.onMenu2(sender:)) || action == #selector(SecondViewController.onMenu3(sender:)) {
            return true
        }
        return false
    }
    
    // 作成したMenuItemが押された際に呼び出される
    @objc internal func onMenu1(sender: UIMenuItem) {
        print("onMenu1")
    }
    
    @objc internal func onMenu2(sender: UIMenuItem) {
        print("onMenu2")
    }
    
    @objc internal func onMenu3(sender: UIMenuItem) {
        print("onMenu3")
    }
    
    @objc internal func onClickNaviButton_2(sender: UIButton) {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    @objc internal func onClickNaviButton_3(sender: UIButton) {
        let viewController = ViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  

}
