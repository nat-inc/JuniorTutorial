//
//  SecondViewController.swift
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

class SecondViewController: UIViewController {

    var blurImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Second View"
        self.view.backgroundColor = UIColor.white
        
        // ラスタライズ化の初期値
        let initRasterizeValue: CGFloat = 1.0
        
        // スライダー
        let rasterizeSlider = UISlider()
        rasterizeSlider.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 100)
        rasterizeSlider.layer.zPosition = 1
        rasterizeSlider.minimumValue = 0.1
        rasterizeSlider.maximumValue = 1.0
        rasterizeSlider.value = Float(1.0 - initRasterizeValue)
        rasterizeSlider.addTarget(self, action: #selector(SecondViewController.onValueChanged(slider:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(rasterizeSlider)
    
        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(SecondViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        // UIImage作成
        let myImage = UIImage(named: "IMG_7572.jpeg")!
        
        // リサイズされたUIImageを指定してUIImageViewを作成
        blurImageView = UIImageView(image: UIImage.ResizeUIImage(image: myImage, width: self.view.frame.width*2/3, height: self.view.frame.height*2/3))
        blurImageView?.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        if blurImageView != nil {
            
            // ラスタライズ化
            blurImageView!.layer.shouldRasterize = true
            
            // 値の初期化
            blurImageView!.layer.rasterizationScale = initRasterizeValue
            
            self.view.addSubview(blurImageView!)
        }
        
    }
    
    // Sliderの値が変わったときに呼ばれるメソッド
    @objc func onValueChanged(slider: UISlider) {
        if blurImageView != nil {
            
            // ラスタライズ化
            blurImageView!.layer.rasterizationScale = CGFloat(1.1 - slider.value)
        }
    }

    @objc func onClickNaviButton(sender:UIButton) {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
}
