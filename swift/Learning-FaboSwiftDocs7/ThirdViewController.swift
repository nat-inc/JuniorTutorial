//
//  ThirdViewController.swift
//  Learning-FaboSwiftDocs7
//
//  Created by 小室沙央里 on 2022/09/02.
// ①UIToolBarの表示
// ②UISegmentedControlの表示
// ③UIStepperの表示
// ④UINavigationItemでUINavigationBarを設定
// ⑤UIAlertControllerでActionSheet表示
// ⑥UIMenuControllerにMenuItemを追加
// ⑦UIViewにBlurエフェクトを適用させる
// ⑧UIViewにUIMotionEffectを追加--?--
import UIKit

class ThirdViewController: UIViewController {

    // ⑦
    private var imageView: UIImageView!
    private var effectView: UIVisualEffectView!
    private var mySegcon_2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ⑦
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "IMG_7572.jpeg")
        self.view.addSubview(imageView)
        
        // ④Naviボタン
        let naviButton_3 = UIButton(frame:CGRect(x:0, y:0, width:100, height:50))
        naviButton_3.backgroundColor = UIColor.orange
        naviButton_3.layer.position = CGPoint(x:self.view.bounds.width*2/3, y:330)
        naviButton_3.layer.masksToBounds = true
        naviButton_3.layer.cornerRadius = 20.0
        naviButton_3.setTitle("進む", for: .normal)
        naviButton_3.addTarget(self, action: #selector(ThirdViewController.onClickNaviButton_4(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton_3)
        
        let naviButtonback_2 = UIButton(frame:CGRect(x:0, y:0, width:100, height:50))
        naviButtonback_2.backgroundColor = UIColor.orange
        naviButtonback_2.layer.position = CGPoint(x:self.view.bounds.width*1/3, y:330)
        naviButtonback_2.layer.masksToBounds = true
        naviButtonback_2.layer.cornerRadius = 20.0
        naviButtonback_2.setTitle("戻る", for: .normal)
        naviButtonback_2.addTarget(self, action: #selector(ThirdViewController.onClickNaviButton_5(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButtonback_2)
        
        // ⑦
        // SegmentedControlを生成
        mySegcon_2 = UISegmentedControl(items:["Dark", "ExtraLight", "Light"])
        mySegcon_2.center = CGPoint(x:self.view.center.x, y:self.view.bounds.maxY - 50)
        mySegcon_2.backgroundColor = UIColor.gray
        mySegcon_2.tintColor = UIColor.white
        mySegcon_2.addTarget(self, action: #selector(ThirdViewController.onClickMySegmentedControl(sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(mySegcon_2)
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        self.title = "Third View"
    }
    
    // ⑦
    // エフェクトを適用
    internal func addVirtualEffectView(effect: UIBlurEffect!) {
        
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        
        // Blurエフェクトを適用するEffectViewを作成
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 0, y: 0, width: imageView.bounds.width / 2, height: imageView.bounds.height / 2)
        effectView.layer.position = CGPoint(x:imageView.bounds.midX, y:imageView.bounds.midY)
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        imageView.addSubview(effectView)
    }
    
    
    // SegmentedControlの値が変わったときに呼び出されるメソッド
    @objc internal func onClickMySegmentedControl(sender: UISegmentedControl) {
        var effect: UIBlurEffect!
        switch sender.selectedSegmentIndex {
        case 0:
            effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        case 1:
            effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        case 2:
            effect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        default:
            print("Error")
        }
        self.addVirtualEffectView(effect: effect)
    }
    
    
    @objc internal func onClickNaviButton_4(sender: UIButton) {
        let fourthViewController = FourthViewController()
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }
    
    @objc internal func onClickNaviButton_5(sender: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}
