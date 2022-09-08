//
//  FourthViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/08.
//
// ①セカンドScreenへの描画(ViewController)　※iPhoneの実機buildできないため実装未確認（iPadはできる）
// ②周期の違うUIScrollViewを同期させる(SecondViewController)
// ③プルンプルンするButtonの作成(ThirdViewController)
// ④カスタマイズButton(ThirdViewController, MyButton_2)
// ⑤UIパーツの削除(FourthViewControllew)

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
