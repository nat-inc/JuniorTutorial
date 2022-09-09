//
//  MyButton_2.swift
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

class MyButton_2: UIButton {

    // ④
    var myStatus: ButtonStatus!
    enum ButtonStatus {
        case Normal
        case TouchBegan
        case TouchEnded
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        myStatus = .Normal
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        myStatus = .TouchBegan
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        myStatus = .TouchEnded
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let width = rect.width, height = rect.height
        
        if myStatus == .Normal || myStatus == .TouchEnded {
            
            // 色の定義
            let color = UIColor(red: 0.081, green: 1.000, blue: 0.421, alpha: 1.000)
            
            // ボタンの形状を定義
            let path = makeNormalPath(width: width, height: height)
            color.setFill()
            path.fill()
            path.lineWidth = 0
            path.stroke()
            
        } else if myStatus == .TouchBegan {
            
            // 色の定義
            let color = UIColor(red: 1.000, green: 1.000, blue: 0.421, alpha: 1.000)
            
            let path = makeNormalPath(width: width, height: height)
            color.setFill()
            path.fill()
            path.lineWidth = 0
            path.stroke()
        }
        
        super.draw(rect)
    }
    
    // ボタンの形状を作成
    
    private func makeNormalPath(width: CGFloat, height: CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x:46.33/120 * width, y:0.5/120 * height))
               bezierPath.addCurve(to: CGPoint(x:37.47/120 * width, y:30.41/120 * height),
                                   controlPoint1: CGPoint(x:38.21/120 * width, y:0.5/120 * height),
                                   controlPoint2: CGPoint(x:45.96/120 * width, y:18.21/120 * height))
               //
               bezierPath.addCurve(to: CGPoint(x:0.54/120 * width, y:30.41/120 * height),
                                          controlPoint1: CGPoint(x:28.97/120 * width, y:42.61/120 * height),
                                          controlPoint2: CGPoint(x:2.75/120 * width, y:21.75/120 * height))
               bezierPath.addCurve(to: CGPoint(x:28.61/120 * width, y:65.04/120 * height),
                                          controlPoint1: CGPoint(x:-1.68/120 * width, y:39.06/120 * height),
                                          controlPoint2: CGPoint(x:28.61/120 * width, y:53.23/120 * height))
               bezierPath.addCurve(to: CGPoint(x:12.36/120 * width, y:96.52/120 * height),
                                          controlPoint1: CGPoint(x:28.61/120 * width, y:76.84/120 * height),
                                          controlPoint2: CGPoint(x:4.23/120 * width, y:91.79/120 * height))
               bezierPath.addCurve(to: CGPoint(x:61.1/120 * width, y:83.92/120 * height),
                                          controlPoint1: CGPoint(x:20.48/120 * width, y:101.24/120 * height),
                                          controlPoint2: CGPoint(x:38.21/120 * width, y:83.92/120 * height))
               bezierPath.addCurve(to: CGPoint(x:100.99/120 * width, y:105.96/120 * height),
                                          controlPoint1: CGPoint(x:84/120 * width, y:83.92/120 * height),
                                          controlPoint2: CGPoint(x:95.82/120 * width, y:114.62/120 * height))
               bezierPath.addCurve(to: CGPoint(x:86.22/120 * width, y:65.04/120 * height),
                                          controlPoint1: CGPoint(x:106.16/120 * width, y:97.3/120 * height),
                                          controlPoint2: CGPoint(x:83.63/120 * width, y:81.56/120 * height))
               bezierPath.addCurve(to: CGPoint(x:114.29/120 * width, y:13.09/120 * height),
                                          controlPoint1: CGPoint(x:88.8/120 * width, y:48.51/120 * height),
                                          controlPoint2: CGPoint(x:117.24/120 * width, y:17.81/120 * height))
               bezierPath.addCurve(to: CGPoint(x:69.97/120 * width, y:30.41/120 * height),
                                          controlPoint1: CGPoint(x:111.33/120 * width, y:8.37/120 * height),
                                          controlPoint2: CGPoint(x:86.96/120 * width, y:37.88/120 * height))
               bezierPath.addCurve(to: CGPoint(x:46.33/120 * width, y:0.5/120 * height),
                                          controlPoint1: CGPoint(x:52.98/120 * width, y:22.93/120 * height),
                                          controlPoint2: CGPoint(x:54.46/120 * width, y:0.5/120 * height))
               bezierPath.close()

               return bezierPath
    }
    
}
