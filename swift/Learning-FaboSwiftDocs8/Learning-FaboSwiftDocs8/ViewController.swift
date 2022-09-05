//
//  ViewController.swift
//  Learning-FaboSwiftDocs8
//
//  Created by 小室沙央里 on 2022/09/05.
//
// ①UIViewにトランジションをつける
// ②タッチイベントの有効/無効を切り替える


import UIKit

class ViewController: UIViewController {

    // ①
    private var myView: UIView!
    private var myButton: UIButton!
    
    // ②
    private var cnt: Float = 0
    private var myLabel: UILabel!
    private var ButtonCnt: Int = 0
    private var TimerMargin: Float = 0
    private var ignoreBegineTime: Float = 0
    
    // View切り替え用フラグ
    var viewFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.cyan
        
        // ①
        // myViewを生成
        myView = UIView(frame: self.view.frame)
        myView.backgroundColor = UIColor.orange
        myView.isHidden = true
        myView.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        // ボタンを生成
        myButton = UIButton(frame: CGRect(x:0, y:0, width: 100, height: 50))
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("Transition", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for:.touchUpInside)
        
        self.view.addSubview(myView)
        self.view.addSubview(myButton)
        
        // ②
        let myButton_2: UIButton = UIButton()
        myButton_2.frame = CGRect(x:0, y:0, width: 200, height: 50)
        myButton_2.layer.cornerRadius = 20.0
        myButton_2.layer.position = CGPoint(x:self.view.frame.width/2, y:300)
        myButton_2.backgroundColor = UIColor.red
        myButton_2.setTitle("有効/無効", for: .normal)
        myButton_2.addTarget(self, action: #selector(ViewController.onClickMyButton_2(sender:)), for: .touchUpInside)
        
        // タイマー用ラベルを作る
        myLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 50))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Time:\(Int(cnt))"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
       
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton_2)
        
    }

    // ①
    @objc internal func onClickMyButton(sender: UIButton) {
        
        // フラグがtrue
        if viewFlag {
            
            // アニメーション処理
            // どのviewからtransitionするか
            UIView.transition(from: self.view,
                              
               to: myView,
                              
               // duration: 1.0 = 秒数（1秒）
               duration: 1.0,
                              
               // transitionを設定
               options: UIView.AnimationOptions.transitionCurlUp,
                              
               // アニメーション完了時の処理
               completion:{ (Bool) -> Void in
                
                   print("self.view -> myView")
                
                   // myViewを表示
                   self.myView.isHidden = false
                
                   // myViewにボタンを追加
                   self.myView.addSubview(self.myButton)
        })
            viewFlag = false
            
        } else {
            UIView.transition(from: myView,
                              to: self.view,
                              duration: 1.0,
                              options: UIView.AnimationOptions.transitionFlipFromLeft,
                              completion: { (Bool) -> Void in
                                
                                  print("myView -> self.view")
                
                                  // self.viewにボタンを追加
                                  self.view.addSubview(self.myButton)
                })
            // フラグを立てる
            viewFlag = true
        }
    }
    
    // ②NSTimerIntervalで指定された秒数毎に呼び出されるメソッド
    @objc internal func ouUpdate(timer: Timer) {
        
        cnt += 0.1
        
        // 桁数を指定して文字列を作る
        let str = "Time: \(Int(cnt))"
        myLabel.text = str
        
        // 現在のタイマー時間から向こうが始まった時間の差
        TimerMargin = cnt - ignoreBegineTime
        
        // タッチイベントが無効の時
//        if UIApplication.shared.isIgnoringInteractionEvents {
        if view.isUserInteractionEnabled == false {
            
            // 無効になってから5秒経った時
            if Int(TimerMargin) == 5 {
                
                print("タッチイベントが無効です")
                self.view.backgroundColor = UIColor.cyan
                
                // タッチイベントを有効にする
//                UIApplication.shared.endIgnoringInteractionEvents()
                view.isUserInteractionEnabled = true
                print("タッチイベントを有効にしました")
            }
        }
    }
    
    @objc internal func onClickMyButton_2(sender: UIButton) {
        
        // ボタンを押した回数
        ButtonCnt += 1
        
        // タッチイベントが有効の時
//        if UIApplication.shared.isIgnoringInteractionEvents == false {
        if view.isUserInteractionEnabled == true {
            
            print("タッチイベントが有効です")
            self.view.backgroundColor = UIColor.green
            
            // タッチイベントを無効にする
//            UIApplication.shared.beginIgnoringInteractionEvents()
            view.isUserInteractionEnabled = false
            
            // 無効が始まった時間を取得
            ignoreBegineTime = cnt
            
            print("タッチイベントを無効にしました")
            print("5秒後に有効になります")
            
            // 最初にボタンを押した時だけタイマーを作る
            if ButtonCnt == 1 {
                
                // タイマーを作る
                // 更新のインターバル（0.1秒）
                Timer.scheduledTimer(timeInterval: 0.1,
                                     
                                     // そのクラスのメソッドか
                                     target: self,
                                     
                                     // メソッド
                                     selector: #selector(ViewController.ouUpdate(timer:)),
                                     userInfo: nil,
                                     
                                     // 何回も呼び出すかどうか
                                     repeats: true)
            }
        }
    }
    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
}
