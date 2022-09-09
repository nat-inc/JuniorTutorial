//
//  FifthViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/08.
//
// ①セカンドScreenへの描画(ViewController)
// ②周期の違うUIScrollViewを同期させる(SecondViewController)
// ③プルンプルンするButtonの作成(ThirdViewController)
// ④カスタマイズButton(ThirdViewController, MyButton_2)
// ⑤UIパーツの削除(FourthViewControllew)
// ⑥UIBezierPathで図形を描画(FifthViewControllew)
// ⑦UICollectionViewを使う(SixthViewControllew)
// ⑧UICollectionViewのCellをカスタマイズ(SeventhViewControllew)
// ⑨UICollectionViewをセクション毎に分ける(EighthViewControllew)
import UIKit

class FifthViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fifth View"
        self.view.backgroundColor = UIColor(red: 0.902, green: 0.803, blue: 0.890, alpha: 1.0)
        
        // SegmentedControllerを生成
        let mySegcon = UISegmentedControl(items: ["Circle", "Rectangle", "Line"])
        mySegcon.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blue
        mySegcon.addTarget(self, action: #selector(FifthViewController.changedValue(sender:)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(mySegcon)
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0121112
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(FifthViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)

    }
    
    // SegmentedControllerの値が変わった時に呼ばれるメソッド
    @objc func changedValue(sender: UISegmentedControl) {
        var myDrawView: UIView!
        
        // SegmentedControllerの値によってそれぞれのクラスのインスタンスを生成
        switch(sender.selectedSegmentIndex) {
        case 0:
            myDrawView = drawCircleView(frame: CGRect(x:0, y:0, width: 300, height: 300))
        case 1:
            myDrawView = drawRectangleView(frame: CGRect(x:0, y:0, width: 300, height: 300))
        case 2:
            myDrawView = drawLineView(frame: CGRect(x:0, y:0, width: 300, height: 300))
        default:
            print("error")
            return
        }
        
        // 描画用viewの中心を設定
        myDrawView.center = CGPoint(x:self.view.frame.width/2, y:170)
        myDrawView.backgroundColor = UIColor.white
        
        // 描画用viewをviewに設定
        self.view.addSubview(myDrawView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let sixthViewController = SixthViewController()
        self.navigationController?.pushViewController(sixthViewController, animated: true)
    }


}
