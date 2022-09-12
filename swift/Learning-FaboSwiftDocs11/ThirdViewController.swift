//
//  ThirdViewController.swift
//  Learning-FaboSwiftDocs11
//
//  Created by 小室沙央里 on 2022/09/12.
//
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

import UIKit


extension UIImage {
    // 画像を合成するクラスメソッド
    class func ComposeUIImage(UIImageArray: [UIImage], width: CGFloat, height: CGFloat) -> UIImage! {
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // UIImageのある分回す
        for image: UIImage in UIImageArray {
            
            image.draw(in: CGRect(x:0, y:0, width: image.size.width, height: image.size.height))
        }
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Third View"
        self.view.backgroundColor = UIColor.white
        
        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(ThirdViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        // 1つ目のUIImage作成
        var myImage1 = UIImage(named: "IMG_7572.jpeg")!
        
        // リサイズ
        myImage1 = UIImage.ResizeUIImage(image: myImage1, width: self.view.frame.width*2/3, height: self.view.frame.height*2/3)
        
        // 2つ目のUIImage作成
        var myImage2 = UIImage(named:"coffee.png")!
        
        // リサイズ後のwidthをアスペクト比を元に、リサイズ後のサイズを取得(※別URL参照)
        let aspectRate = myImage2.size.height / myImage2.size.width
        let width = self.view.frame.width/2
        
        myImage2 = UIImage.ResizeUIImage(image: myImage2, width: self.view.frame.width/2, height: width * Double(aspectRate))
       
        // 画像を合成
        let ComposedImage = UIImage.ComposeUIImage(UIImageArray: [myImage1,myImage2], width: self.view.frame.width, height: self.view.frame.height)
        
        // UIImageViewに合成されたUIImageを指定
        let myImageView = UIImageView(image: ComposedImage)
        
        self.view.addSubview(myImageView)
        
    }
    
    
    @objc func onClickNaviButton(sender: UIButton) {
        let fourthViewController = FourthViewController()
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }

}
