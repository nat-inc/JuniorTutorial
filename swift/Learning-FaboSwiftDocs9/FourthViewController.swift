//
//  FourthViewController.swift
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

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Fourh View"
        self.view.backgroundColor = UIColor.white
        
        // ⑤
        let myButton_3 = UIButton(frame: CGRect(x:100, y:100, width: 100, height: 100))
        myButton_3.setTitle("UIボタン", for: UIControl.State.normal)
        myButton_3.setTitleColor(UIColor.black, for: UIControl.State.normal)
        myButton_3.backgroundColor = UIColor.green
        
        let label = UILabel(frame: CGRect(x:100, y: 200, width: 100, height: 100))
        label.text = "UIラベル"
        label.textColor = UIColor.green
        label.backgroundColor = UIColor.red
        
        self.view.addSubview(myButton_3)
        
        print("View:\(view.description)")
        
        let views = self.view.subviews
        for myView in views {
            print("View:\(myView.description)")
            
            if myView.isKind(of: UIButton.self) {
                myView.removeFromSuperview()
                self.view.addSubview(label)
            }
        }
        // Do any additional setup after loading the view.
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0121112
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(FourthViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
    }
    

    @objc func onClickNaviButton(sender: UIButton) {
        let fifthViewController = FifthViewController()
        self.navigationController?.pushViewController(fifthViewController, animated: true)
    }


}
