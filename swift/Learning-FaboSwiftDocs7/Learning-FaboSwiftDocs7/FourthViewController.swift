//
//  FourthViewController.swift
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

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        self.title = "Fourth View"
        
        // ⑧
        // UIViewを作成
        let myBox = UIView(frame: CGRect(x:0, y:0, width: 200, height: 200))
        myBox.backgroundColor = UIColor.black
        myBox.layer.masksToBounds = true
        myBox.layer.cornerRadius = 20.0
        myBox.layer.position = self.view.center
        myBox.layer.zPosition = 1
        self.view.addSubview(myBox)

        // Do any additional setup after loading the view.
        
        // Labelを作成
        let myLabel = UILabel(frame:CGRect(x:0, y:0, width:200, height:200))
        myLabel.backgroundColor = UIColor.gray
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Swift!!"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.orange
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.zPosition = 2
        myLabel.layer.position = self.view.center
        self.view.addSubview(myLabel)
        
        // 端末のx軸方向の傾きに応じてmyBoxの位置を変えるエフェクトを作成
        let xAxis1 = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        // Horizontal = 水平
        xAxis1.minimumRelativeValue = -200.0 // Relative = 相対的
        xAxis1.maximumRelativeValue = 200.0
        
        // 端末のy軸方向の傾きに応じてmyBoxの位置を変えるエフェクトを作成
        let yAxis1 = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        // Vertical = 垂直
        yAxis1.minimumRelativeValue = -200.0
        yAxis1.maximumRelativeValue = 200.0
        
        // モーションエフェクトのグループを作成
        let group1 = UIMotionEffectGroup()
        group1.motionEffects = [xAxis1, yAxis1]
        
        // 端末のx軸方向の傾きに応じてmyLabelの位置を変えるエフェクトを作成
        let xAxis = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        xAxis.minimumRelativeValue = -50.0
        xAxis.maximumRelativeValue = 50.0
        
        // 端末のy軸方向の傾きに応じてmyLabelの位置を変えるエフェクトを作成
        let yAxis = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        yAxis.minimumRelativeValue = -50.0
        yAxis.maximumRelativeValue = 50.0
        
        // モーションエフェクトのグループを作成
        let group = UIMotionEffectGroup()
        group.motionEffects = [xAxis, yAxis]
        
        // myLabelにエフェクトを適用させる
        myBox.addMotionEffect(group1)
        myLabel.addMotionEffect(group)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
