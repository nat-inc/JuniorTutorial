//
//  ViewController.swift
//  Learning-FaboSwiftDocs
//
//  Created by 小室沙央里 on 2022/08/19.
//  UILabel --->

// ①UIFontで文字を表示
// ②UserNotificationを表示

import UIKit

class ViewController: UIViewController {
    
    private let BUTTON_NORMAL: Int = 1
    private let BUTTON_FIRE: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Notificationの表示許可をもらう
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        //すぐにNotificationを発火するボタン
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 80
        let posX: CGFloat = (self.view.bounds.width - buttonWidth) / 2
        let posY: CGFloat = 300
        
        let myButton: UIButton = UIButton(frame: CGRect(x: posX, y: posY, width:  buttonWidth, height: buttonHeight))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.tag = BUTTON_NORMAL
        myButton.setTitle("Notification", for: .normal)
        myButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchDown)
        view.addSubview(myButton)
        
        //時間を置いてNotificationを発火するボタン
        let posFireX: CGFloat = (self.view.bounds.width - buttonWidth) / 2
        let posFireY: CGFloat = 450
        
        let myFireButton: UIButton = UIButton(frame: CGRect(x: posFireX, y: posFireY, width: buttonWidth, height: buttonHeight))
        myFireButton.backgroundColor = UIColor.blue
        myFireButton.layer.masksToBounds = true
        myFireButton.layer.cornerRadius = 20.0
        myFireButton.tag = BUTTON_FIRE
        myFireButton.setTitle("Fire Notification", for: .normal)
        myFireButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchDown)
        view.addSubview(myFireButton)
        
        
        //小さめのフォントの文字列をラベルに表示
        let mySmallLabel:UILabel = UILabel(frame: CGRect(x: 25, y: 0, width: 300, height: 150))
        //CGRectは「位置x、位置y、（←の位置を起点とした）幅、高さ」
        mySmallLabel.text = "小さめフォント"
        mySmallLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        self.view.addSubview(mySmallLabel)
        
        //システムの標準のフォントサイズの文字列をラベルに表示
        let myNormalLabel:UILabel = UILabel(frame: CGRect(x: 25, y: 30, width: 200, height: 150))
        myNormalLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        myNormalLabel.text = "システム標準のフォントサイズ"
        self.view.addSubview(myNormalLabel)
        
        //UIButton用のフォントサイズの文字列をラベルに表示
        let myButtonLabel: UILabel = UILabel(frame: CGRect(x: 25, y: 60, width: 300, height: 150))
        myButtonLabel.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        myButtonLabel.text = "UIButtonのフォントサイズ"
        self.view.addSubview(myButtonLabel)
        
        //カスタムしたフォントサイズの文字列をラベルに表示
        let myCustomLabel: UILabel = UILabel(frame: CGRect(x: 25, y: 90, width: 300, height: 150))
        myCustomLabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        myCustomLabel.text = "ポイント20のフォントサイズ"
        self.view.addSubview(myCustomLabel)
        
        //Italic Syetem Fontの文字列をラベルに表示
        let myItalicLabel: UILabel = UILabel(frame: CGRect(x: 25, y: 120, width: 300, height: 150))
        myItalicLabel.font = UIFont.italicSystemFont(ofSize: UIFont.labelFontSize)
        //labelFontSizeはsystemFontSizeより小さい
        myItalicLabel.text = "Italicフォント"
        self.view.addSubview(myItalicLabel)
        
        //Boldの文字列をラベルに表示
        let myBoldLabel: UILabel = UILabel(frame: CGRect(x: 25, y: 150, width: 300, height: 150))
        myBoldLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        myBoldLabel.text = "Boldフォント"
        self.view.addSubview(myBoldLabel)
        
        //Arialの文字列をラベルに表示
        let myArialLabel: UILabel = UILabel(frame: CGRect(x: 25, y: 180, width: 300, height: 150))
        myArialLabel.font = UIFont(name: "ArilHebrew", size: UIFont.labelFontSize)
        myArialLabel.text = "ArilHebrew"
        self.view.addSubview(myArialLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton")
        if sender.tag == BUTTON_NORMAL {
            showNotification()
        }else if  sender.tag == BUTTON_FIRE {
            showNotificationFire()
        }
    }
    
    private func showNotification() {
        print("showNotification")
        
        //Notificationを生成
        let content = UNMutableNotificationContent()
        
        //Titleを代入
        content.title = "Title1"
        
        //Bodyを代入
        content.body = "Hello Notification"
        
        //音を設定する
        content.sound = UNNotificationSound.default
        
        //Requsetを生成する
        let request = UNNotificationRequest.init(identifier: "Title1", content: content, trigger: nil)
        
        //Notificationを発行する
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error as Any)
        }
        
    }
    
    private func showNotificationFire() {
        print("showNotificationFire")
        
        //Notificationを生成
        let content = UNMutableNotificationContent()
        
        //Titleを代入
        content.title = "Title2"
        
        //Bodyを代入
        content.body = "Hello Notification"
        
        //音を設定する
        content.sound = UNNotificationSound.default
        
        //triggerを生成する
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        
        //Requsetを生成する
        let request = UNNotificationRequest.init(identifier: "Title1", content: content, trigger: trigger)
        
        //Notificationを発行する
        let center = UNUserNotificationCenter.current()
        center.add(request) {(error) in
            print(error as Any)
        }
    }
}

