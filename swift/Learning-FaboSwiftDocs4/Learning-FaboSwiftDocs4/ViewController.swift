//
//  ViewController.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/24.
// ①UITabBarControllerでタブの表示(First)
// ②UIImageViewで画像を表示
// ③UIScrollViewの表示(Second)
// ④UITextViewで複数行のテキストの表示(First)

import UIKit

class FirstViewController: UIViewController {

    // ①
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色を設定
        self.view.backgroundColor = UIColor.cyan
        
        //tabBarItemのアイコンをFeaturedに。タグを1と定義する。
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // ②
        // 画像を設定する
        let myImage: UIImage = UIImage(named: "donutAndCoffee")!
        let iWidth: CGFloat = 100
        let iHeight: CGFloat = 100
        
        // ------画像を縮小（0.5倍）、表示する座標を設定------
        let downPosX: CGFloat = (self.view.bounds.width - iWidth)/2
        let downPosY: CGFloat = 50
        
        // 表示用のUIImageViewを生成
        let myScaleDownView: UIImageView = UIImageView(frame: CGRect(x: downPosX, y: downPosY, width: iWidth, height: iHeight))
        
        //　UIImageViewに画像を設定
        myScaleDownView.image = myImage
        
        // 縮小用（0.5倍）のアフィン行列を生成
        myScaleDownView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        
        self.view.addSubview(myScaleDownView)
        
        // ------画像を縮小（1.2倍）、表示する座標を設定------
        let upPosX: CGFloat = (self.view.bounds.width - iWidth)/2
        let upPosY: CGFloat = 130
        
        let myScaleUpView: UIImageView = UIImageView(frame: CGRect(x: upPosX, y: upPosY, width: iWidth, height: iHeight))
        myScaleUpView.image = myImage
        myScaleUpView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        self.view.addSubview(myScaleUpView)
        
        // ------画像を回転、表示する座標を設定------
        let rotatePosX: CGFloat = (self.view.bounds.width - iWidth) / 2
        let rotatePosY: CGFloat = 240
        
        // 表示用のUIImageViewを生成
        let myRotateView: UIImageView = UIImageView(frame:CGRect(x: rotatePosX, y: rotatePosY, width: iWidth, height: iHeight))
        
        myRotateView.image = myImage
        
        // radianで回転角度を指定（30度）する
        let angle: CGFloat = CGFloat((30.0 * M_PI) / 180.0)
       
        // 回転用のアフィン行列を生成する
        myRotateView.transform = CGAffineTransform(rotationAngle: angle)
        self.view.addSubview(myRotateView)
        
        // ------画像を反転、表示する座標を設定------
        let reversePosX: CGFloat = (self.view.bounds.width - iWidth) / 2
        let reversePosY: CGFloat = 350
        
        let myReverseView: UIImageView = UIImageView(frame: CGRect(x: reversePosX, y: reversePosY, width: iWidth, height: iHeight))
        myReverseView.image = myImage
        myReverseView.transform = myReverseView.transform.scaledBy(x: -1.0, y: -1.0)
        
        self.view.addSubview(myReverseView)
        
        // ④
        // TextView生成
        let myTextView: UITextView = UITextView(frame: CGRect(x: 10, y: 480, width: self.view.frame.width - 20, height: 100))
        
        myTextView.backgroundColor = UIColor.lightGray
        myTextView.text = "1234567890qwertyuiop 1234567890 東京都港区芝公園4-2　080-0000-0000 asdfghjkl 2022/08/26"
        myTextView.layer.masksToBounds = true
        myTextView.layer.cornerRadius = 20.0
        
        // 枠線の太さを設定
        myTextView.layer.borderWidth = 1
        
        // 枠線の色を設定
        myTextView.layer.borderColor = UIColor.black.cgColor
        
        myTextView.font = UIFont.systemFont(ofSize: 20.0)
        myTextView.textColor = UIColor.black
        
        // 左詰めの設定
        myTextView.textAlignment = NSTextAlignment.left

        // リンク、住所、電話番号などを自動的に検出し、リンクに変換
        myTextView.dataDetectorTypes = UIDataDetectorTypes.all
        
        // 影の濃さを設定
        myTextView.layer.shadowOpacity = 0.8
        
        // テキストを編集不可にする
        myTextView.isEditable = false
        
        self.view.addSubview(myTextView)
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
    }

}
