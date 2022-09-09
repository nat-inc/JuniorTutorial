//
//  drawLineView.swift
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

import UIKit

class drawLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 表示を更新する必要が生ずると自動的に呼び出される
    override func draw(_ rect: CGRect) {
        
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        let myLine: UIBezierPath = UIBezierPath()
        
        UIColor.red.setStroke()
        
        // 始点を設定
        myLine.move(to: CGPoint.zero)
        
        // 次点を設定
        myLine.addLine(to: CGPoint(x:50, y:150))
        myLine.addLine(to: CGPoint(x:200, y:100))
        
        // 終点を設定
        myLine.addLine(to: CGPoint(x:self.bounds.width, y:self.bounds.height))
        
        // 始点と終着点を繋いで閉じる
        myLine.close()
        
        UIColor.yellow.setFill()
        myLine.fill()
        myLine.lineWidth = 3.0
        myLine.stroke()
    }
}
