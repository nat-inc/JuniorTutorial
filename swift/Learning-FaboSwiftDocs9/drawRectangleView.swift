//
//  drawRectangleView.swift
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

class drawRectangleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 表示を更新する必要が生ずると自動的に呼び出される
    
    override func draw(_ rect: CGRect) {
        
        // viewの設定
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        // 長方形のUIBezierPathを生成
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:5, y:5, width: 290, height: 290))
        
        // 線の色を青色に設定
        UIColor.blue.setStroke()
        
        // 線の太さを設定
        myRect1.lineWidth = 1.0
        
        // 描画
        myRect1.stroke()
        
        // 角丸の長方形のUIBezierPathを生成
        let myRect2: UIBezierPath = UIBezierPath(roundedRect: CGRect(x:50, y:50, width: 200, height: 100),
                                                 
                                                 // すべての角を丸くする
                                                byRoundingCorners: UIRectCorner.allCorners,
                                                
                                                 // 丸くする角を設定
                                                 cornerRadii: CGSize(width: 5.0, height: 5.0))
      
        UIColor.orange.setStroke()
        
        UIColor.yellow.setFill()
        
        myRect2.fill()
        
        myRect2.lineWidth = 3.0
        
        myRect2.stroke()
        
        
    }

}
