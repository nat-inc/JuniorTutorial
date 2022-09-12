//
//  FourthViewController.swift
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

extension UIView {
    
    func GetImage() -> UIImage {
        
        // キャプチャする範囲を取得
        let rect = self.bounds
        
        // ビットマップ画像のcontextを作成
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // 対象のview内の描画をcontextに複写
        self.layer.render(in: context)
        
        // 現在のcontextのビットマップをUIImageとして取得
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return capturedImage
        
    }
}

class FourthViewController: UIViewController {

    var myLabel: UILabel!
    var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fourth View"
        self.view.backgroundColor = UIColor.white
        
        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(FourthViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myLabel.text = "test"
        myLabel.textColor = UIColor.white
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 50.0
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.backgroundColor = UIColor.blue
        myLabel.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 - 200)
        self.view.addSubview(myLabel)
        
        // ImageView生成
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myImageView.layer.borderWidth = 0.5
        self.view.addSubview(myImageView)
        
        // Button生成
        let myButton = UIButton(frame: CGRect(x:0, y:0, width: 50,height: 50))
        myButton.setTitle("push", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        myButton.addTarget(self, action: #selector(FourthViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(myButton)
    }

    // ボタンが押されたときに呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton) {
        
        // キャプチャ画像を取得
        let myImage = myLabel.GetImage() as UIImage
        
        // ImageViewのimageにセット
        myImageView.image = myImage
        
        // 縦横比率を保ちつつ画像をUIImageViewの大きさに合わせる
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let fifthViewController = FifthViewController()
        self.navigationController?.pushViewController(fifthViewController, animated: true)
    }

}
