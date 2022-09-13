//
//  ViewController.swift
//  Learning-FaboSwiftDocs11
//
//  Created by 小室沙央里 on 2022/09/12.
// ①UIImageで画像の透過(ViewController)
// ②UIImageをぼかす(SecondViewController)
// ③UIImageをリサイズする(ViewController)
// ④UIImageを合成する(ThirdViewController)
// ⑤UIViewからUIImageを取得する（スクリーンショット）(FourthViewController)
// ⑥UITextCheckerでスペルチェック(FifthViewController)
// ⑦UIViewにアタッチメントを適用させる(SixthViewController)
// ⑧UIViewに重力を適用させる(SixthViewController)
// ⑨UIViewをスナップさせる(SixthViewController)
// ⑩UIviewを動的に動かす(SixthViewController)
// 11. UIViewアニメーションまとめ(SeventhViewController)

import UIKit

// Resizeのクラスメソッド作成
extension UIImage {
    class func ResizeUIImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage! {
        
        // 指定された画像の大きさのコンテキストを用意
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // コンテキストに画像を描画
        image.draw(in: CGRect(x:0, y:0, width: width, height: height))
        
        // コンテキストからUIImageを作る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        let myImage: UIImage = UIImage(named:"IMG_7572.jpeg")!
        
        // リサイズされたUIImageを指定して、UIImageViewを作成
        let myImageView = UIImageView(image: UIImage.ResizeUIImage(image: myImage, width: self.view.frame.midX, height: self.view.frame.midY))
        
        myImageView.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        // 透過
        myImageView.alpha = 0.05
        
        self.view.addSubview(myImageView)

        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(ViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
    }

    @objc func onClickNaviButton(sender: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

