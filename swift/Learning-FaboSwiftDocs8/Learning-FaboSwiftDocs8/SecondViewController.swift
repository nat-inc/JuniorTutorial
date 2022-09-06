//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs8
//
//  Created by 小室沙央里 on 2022/09/06.
//
// ①UIViewにトランジションをつける(ViewController)
// ②タッチイベントの有効/無効を切り替える(ViewController)
// ③GestureRecognizerのイベント取得(SecondViewController)
// ④UIAlertControllerをパスワード形式にする(ThirdViewController)
// ⑤UIAlertControllerで文字数制限を設ける（ThirdViewController）
// ⑥TableViewのボタンの拡張(FourthViewController)

import UIKit

class SecondViewController: UIViewController {
    
    private var tapLabel: UILabel!
    private var pinchGestureLabel: UILabel!
    private var swipeLabel: UILabel!
    private var longPressLabel: UILabel!
    private var panLabel: UILabel!
    private var rotateLabel: UILabel!
    private var edgeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "My Second View"
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton_2 = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton_2.backgroundColor = UIColor.orange
        naviButton_2.layer.masksToBounds = true
        naviButton_2.layer.cornerRadius = 20.0
        naviButton_2.setTitle("Next", for: .normal)
        naviButton_2.addTarget(self, action: #selector(SecondViewController.onClickNaviButton_2(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton_2)
        
        // タップを認識
        let myTap = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.tapGesture(sender:)))
        
        // ピンチを認識（ピンチイン、ピンチアウト）
        let myPinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(SecondViewController.pinchGesture(sender:)))
        
        // スワイプ認識
        let mySwipe = UISwipeGestureRecognizer(target: self, action: #selector(SecondViewController.swipeGesture(sender:)))
        
        // スワイプ認識-2本指でスワイプ
        mySwipe.numberOfTouchesRequired = 2
        
        // 長押しを認識
        let myLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(SecondViewController.longPressGesture(sender:)))
        
        // 長押し-最低2秒間は長押し
        myLongPressGesture.minimumPressDuration = 2.0
        
        // 長押し-指のズレは15pxまで
        myLongPressGesture.allowableMovement = 150
        
        // パン認識
        let myPan = UIPanGestureRecognizer(target: self, action: #selector(SecondViewController.panGesture(sender:)))
        
        // パン認識-3本指でパン（ドラッグ&ドロップを検知）
        myPan.minimumNumberOfTouches = 3
        
        // 回転を認識（2本指で直線を回転させるイメージ）
        let myRotate = UIRotationGestureRecognizer(target: self, action: #selector(SecondViewController.rotateGesture(sender:)))
        
        // エッジを認識
        let mySEdghePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(SecondViewController.edgeGesture(sender:)))
        
        // エッジを認識-最低指3本で反応(端をスワイプ)
        mySEdghePan.minimumNumberOfTouches = 4
        
        // エッジを認識-左側
        mySEdghePan.edges = UIRectEdge.left
        
        self.view.addGestureRecognizer(myTap)
        self.view.addGestureRecognizer(myPinchGesture)
        self.view.addGestureRecognizer(mySwipe)
        self.view.addGestureRecognizer(myLongPressGesture)
        self.view.addGestureRecognizer(myPan)
        self.view.addGestureRecognizer(myRotate)
        self.view.addGestureRecognizer(mySEdghePan)
        
        let centerOfX = self.view.bounds.width / 2
        
        // Labelを作成
        tapLabel = makeMyLabel(title: "Tap", color: UIColor.red, myX: centerOfX - 50, myY: 190)
        pinchGestureLabel = makeMyLabel(title: "Pinch", color: UIColor.blue, myX: centerOfX + 50, myY: 190)
        swipeLabel = makeMyLabel(title: "Swipe", color: UIColor.green, myX: centerOfX - 50, myY: 280)
        longPressLabel = makeMyLabel(title: "Long", color: UIColor.black, myX: centerOfX + 50, myY: 280)
        panLabel = makeMyLabel(title: "Pan", color: UIColor.orange, myX: centerOfX - 50, myY: 370)
        rotateLabel = makeMyLabel(title: "Rotate", color: UIColor.purple, myX: centerOfX + 50, myY: 370)
        edgeLabel = makeMyLabel(title: "Edge", color: UIColor.cyan, myX: centerOfX - 50, myY: 460)
        
        // Viewに貼り付ける
        self.view.addSubview(tapLabel)
        self.view.addSubview(pinchGestureLabel)
        self.view.addSubview(swipeLabel)
        self.view.addSubview(longPressLabel)
        self.view.addSubview(panLabel)
        self.view.addSubview(rotateLabel)
        self.view.addSubview(edgeLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // タップイベント
    @objc internal func tapGesture(sender: UITapGestureRecognizer) {
        tapLabel.text = "\(sender.numberOfTouches)"
    }
    
    // ピンチイベント
    @objc internal func pinchGesture(sender: UIPinchGestureRecognizer) {
        let firstPonit = sender.scale
        let secondPoint = sender.velocity
        pinchGestureLabel.text = "\(Double(Int(firstPonit*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }

    // スワイプイベント
    @objc internal func swipeGesture(sender: UISwipeGestureRecognizer) {
        let touches = sender.numberOfTouches
        swipeLabel.text = "\(touches)"
    }
    
    // 長押しイベント
    @objc internal func longPressGesture(sender: UILongPressGestureRecognizer) {
        // 指が離れたことを検知
        if(sender.state == UIGestureRecognizer.State.ended) {
            longPressLabel.text = "On"
        }
    }
    
    // パン
    @objc internal func panGesture(sender: UIPanGestureRecognizer) {
        panLabel.text = "\(sender.numberOfTouches)"
    }
    
    // 回転
    @objc internal func rotateGesture(sender: UIRotationGestureRecognizer) {
        let firstPoint = sender.rotation
        let secondPoint = sender.velocity
        rotateLabel.text = "\(Double(Int(firstPoint*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }

    // エッジ
    @objc internal func edgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        let touches = sender.numberOfTouches
        swipeLabel.text = "\(touches)"
    }
    
    internal func makeMyLabel(title: NSString, color: UIColor, myX: CGFloat, myY: CGFloat) -> UILabel {
        let myLabel: UILabel = UILabel()
        myLabel.frame = CGRect(x:0, y:0, width: 80, height: 80)
        myLabel.backgroundColor = color
        myLabel.textColor = UIColor.white
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 40.0
        myLabel.text = title as String
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: myX, y: myY)
        myLabel.numberOfLines = 2
        return myLabel
    }
    
    @objc internal func onClickNaviButton_2(sender: UIButton) {
        
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }

}
