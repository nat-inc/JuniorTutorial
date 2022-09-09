//
//  drawCircleView.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/09.
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

class drawCircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        
        // viewの設定
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        let circlePoint = CGPoint(x:100, y:100)
        
        // 円のBezierPathを生成
        let myCircle: UIBezierPath = UIBezierPath(arcCenter: circlePoint,
                                                  radius: 70.0, // 半径
                                                  startAngle: 0.0, // 初角度
                                                  endAngle: CGFloat(Double.pi*2/4), // 最終角度(※)
                                                  clockwise: false)  // 反時計回り
        
        // 線の色を赤に設定
        UIColor.red.setStroke()
        
        // 塗りつぶしの色を黄色に設定
        UIColor.yellow.setFill()
        
        //　線で閉じた内側を塗りつぶす
        myCircle.fill()
        
        // 線の太さを設定
        myCircle.lineWidth = 3.0
        
        // 描画
        myCircle.stroke()
        
        // 楕円のBezierPathを生成
        let myOval: UIBezierPath = UIBezierPath(ovalIn: CGRect(x:130, y:150, width: 150, height: 100))
        UIColor.blue.setStroke()
        UIColor.gray.setFill()
        myOval.fill()
        myOval.lineWidth = 2.0
        
        myOval.stroke()
    }
    
    
}
