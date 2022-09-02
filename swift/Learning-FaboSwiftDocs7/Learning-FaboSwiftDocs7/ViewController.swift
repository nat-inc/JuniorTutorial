//
//  ViewController.swift
//  Learning-FaboSwiftDocs7
//
//  Created by 小室沙央里 on 2022/09/01.
// ①UIToolBarの表示
// ②UISegmentedControlの表示
// ③UIStepperの表示
// ④UINavigationItemでUINavigationBarを設定
// ⑤UIAlertControllerでActionSheet表示
// ⑥UIMenuControllerにMenuItemを追加
// ⑦UIViewにBlurエフェクトを適用させる
// ⑧UIViewにUIMotionEffectを追加

import UIKit

class ViewController: UIViewController {
    
    // ①
    private var myToolbar: UIToolbar!
    
    // ②
    private let mySegLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 150, height: 150))
    
    // ③
    private let myStepLabel: UILabel = UILabel(frame: CGRect(x:0, y:0, width: 150,height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyan
        
        // ①
        // UIToolBarの表示
        myToolbar = UIToolbar(frame:CGRect(x:0, y:self.view.bounds.size.height - 44, width: self.view.bounds.size.width, height: 40.0))
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-20.0)
        
        // ツールバーの色を決める
        myToolbar.barStyle = .blackTranslucent
        myToolbar.tintColor = UIColor.white
        myToolbar.backgroundColor = UIColor.black
        
        //ボタン1〜3を生成
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(ViewController.onclickBarButton(sender:)))
        myUIBarButtonGreen.tag = 1
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action: #selector(ViewController.onclickBarButton(sender:)))
        myUIBarButtonBlue.tag = 2
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style: .plain, target: self, action: #selector(ViewController.onclickBarButton(sender:)))
        myUIBarButtonRed.tag = 3
        
        // ボタンをツールバーに入れる
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        self.view.addSubview(myToolbar)
        
        // ②
        // 表示する配列を作成
        let myArray: NSArray = ["Yellow", "lightGray", "white"]
        
        // SegmentedControlを作成
        let mySegcon: UISegmentedControl = UISegmentedControl(items: myArray as [AnyObject])
        mySegcon.center = CGPoint(x: self.view.frame.width/2, y:400)
        mySegcon.backgroundColor = UIColor.gray
        mySegcon.tintColor = UIColor.white
        
        mySegcon.addTarget(self, action: #selector(ViewController.segconChanged(segcon:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(mySegcon)
        
        // Labelを作成(○)
        mySegLabel.backgroundColor = UIColor.white
        mySegLabel.layer.masksToBounds = true
        mySegLabel.layer.cornerRadius = 75.0
        mySegLabel.textColor = UIColor.white
        mySegLabel.shadowColor = UIColor.gray
        mySegLabel.font = UIFont.systemFont(ofSize: 30.0)
        mySegLabel.textAlignment = NSTextAlignment.center
        mySegLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
     
        self.view.addSubview(mySegLabel)
        
        // ③
        // Stepperの作成
        let myStepper: UIStepper = UIStepper()
        myStepper.center = CGPoint(x:self.view.frame.width/2, y:650)
        myStepper.backgroundColor = UIColor.gray
        myStepper.tintColor = UIColor.white
        myStepper.addTarget(self, action: #selector(ViewController.stepperOneChanged(stepper:)), for: UIControl.Event.valueChanged)
        
        // 最小値、最大値、規定値の設定
        myStepper.minimumValue = 0
        myStepper.maximumValue = 100
        myStepper.value = 50
        
        // ボタンを押した際に動く値を設定
        myStepper.stepValue = 10
        
        self.view.addSubview(myStepper)
        
        myStepLabel.backgroundColor = UIColor.purple
        myStepLabel.layer.masksToBounds = true
        myStepLabel.layer.cornerRadius = 75.0
        myStepLabel.textColor = UIColor.white
        myStepLabel.shadowColor = UIColor.gray
        myStepLabel.font = UIFont.systemFont(ofSize: 30.0)
        myStepLabel.textAlignment = NSTextAlignment.center
        myStepLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:520)
        myStepLabel.text = "\(myStepper.value)"
        
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(myStepLabel)

        // ④
        // Naviボタン
        let naviButton = UIButton(frame:CGRect(x:0, y:0, width:100, height:50))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.position = CGPoint(x:self.view.bounds.width/2, y:330)
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(ViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        // BarButtonItemを作成
        let myBarButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(ViewController.onClickMyBarButton(sender:)))
        let myBarButton_2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.reply, target: self, action: #selector(ViewController.onClickMyBarButton(sender:)))
        let myBarButton_3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(ViewController.onClickMyBarButton(sender:)))
        
        // Barの左に配置するボタンを配列に格納
        let myRightButtons: NSArray = [myBarButton_1, myBarButton_2]
        
        // NavigationBarの表示
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationItem.title = "Stepper&ToolBar"
        self.navigationItem.prompt = "Prompt"
        // Prompt:ナビゲーションバーの上の表示する文字列。長いメッセージにしてもナビゲーションバーのボタンやタイトルのレイアウトに影響しない。
        
        // Barの左側に複数配置
        self.navigationItem.setRightBarButtonItems(myRightButtons as? [UIBarButtonItem], animated: true)
        
        // Barの右側に配置
        self.navigationItem.setLeftBarButton(myBarButton_3, animated: true)
    }
    
    //  ①UIBarButtonItemが押されたときに呼ばれる
    @objc internal func onclickBarButton(sender:UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.blue
        case 3:
            self.view.backgroundColor = UIColor.red
        default:
            print("ERROR!!")
        }
    }
    
    // ②SegmentedControlの値が変わったときに呼び出される
    @objc internal func segconChanged(segcon: UISegmentedControl) {
        
        switch segcon.selectedSegmentIndex {
        case 0:
            mySegLabel.backgroundColor = UIColor.yellow
        case 1:
            mySegLabel.backgroundColor = UIColor.lightGray
        case 2:
            mySegLabel.backgroundColor = UIColor.white
        default:
            print("Error")
        }
    }
    
    // ③Stepperの値が変わったときに呼び出される
    @objc internal func stepperOneChanged(stepper: UIStepper) {
        myStepLabel.text = "\(stepper.value)"
    }

    // ④ボタンイベント
    @objc internal func onClickNaviButton(sender: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // ④BarButtonイベント
    @objc internal func onClickMyBarButton(sender: UIButton) {
        print("onClickMyBarButton")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
