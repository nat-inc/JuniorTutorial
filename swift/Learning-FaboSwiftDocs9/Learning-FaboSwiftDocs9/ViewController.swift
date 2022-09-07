//
//  ViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/07.
// ①セカンドScreenへの描画(ViewController)　※iPhoneの実機buildできないため実装未確認（iPadはできる）

import UIKit

class ViewController: UIViewController {

    var mySecondWindow: UIWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let screen: NSArray = UIScreen.screens as NSArray
        
        // 接続中の画面が2つある場合、2番目を表示
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens[1]
            showSecondScreenWindow(screen: screen)
        }
        
        // 画面の接続が行われたときに発生するNotification
        let myDefaultCenter: NotificationCenter = NotificationCenter.default
        myDefaultCenter.addObserver(self, selector: #selector(ViewController.screenDidConnect(notification:)), name: UIScreen.didConnectNotification, object: nil)
        
        // Labelを作成
        let myLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 50))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello 1st Screen"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        self.view.addSubview(myLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 画面が接続された時
    @objc func screenDidConnect(notification: NSNotification) {
        print("screenDidConnect")
        
        let screen: NSArray = UIScreen.screens as NSArray
        
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens[1]
            showSecondScreenWindow(screen: screen)
        }
    }
    
    // 画面が切断された時
    @objc func screenDidDisConnect(notification: NSNotification) {
        print("screenDidDisConnect")
    }

    // 画面のモードが変わった時
    @objc func screenDidModeChange(notification: NSNotification) {
        print("screenDidModeChange")
    }

    // 2画面目の画面のレイアウト
    func showSecondScreenWindow(screen: UIScreen!) {
        
        mySecondWindow = UIWindow()
        mySecondWindow.screen = screen
        mySecondWindow.frame = CGRect(x:0, y:0, width: screen.bounds.width, height: screen.bounds.height)
        mySecondWindow.backgroundColor = UIColor.red
        self.mySecondWindow.makeKeyAndVisible()
        
        // Label作成
        let myLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 50))
   
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Second Screen"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.mySecondWindow.bounds.width/2, y: 200)
        self.mySecondWindow.addSubview(myLabel)
        
    }
    
    
}

