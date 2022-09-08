//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/08.
// ①セカンドScreenへの描画(ViewController)　※iPhoneの実機buildできないため実装未確認（iPadはできる）
// ②周期の違うUIScrollViewを同期させる(SecondViewController)
// ③プルンプルンするButtonの作成(ThirdViewController)
// ④カスタマイズButton(ThirdViewController, MyButton_2)
// ⑤UIパーツの削除(FourthViewControllew)

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    // UIPageControl
    var pageControl: UIPageControl!
    
    // UIScrollView
    var scrollViewHeader: UIScrollView!
    var scrollViewMain: UIScrollView!
    
    // ページ番号
    let pageSize = 10
    
    override func viewDidLoad() {
        
        self.title = "My Second View"
        self.view.backgroundColor = UIColor.white
        
        // ②
        // 画面サイズの取得
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        
        // scrollViewHeaderの設定
        scrollViewHeader = UIScrollView(frame: self.view.frame)
        scrollViewHeader.showsHorizontalScrollIndicator = false
        scrollViewHeader.showsVerticalScrollIndicator = false
        scrollViewHeader.isPagingEnabled = true
        scrollViewHeader.delegate = self
        scrollViewHeader.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        self.view.addSubview(scrollViewHeader)
        
        // scrollViewMainの設定
        scrollViewMain = UIScrollView(frame: self.view.frame)
        scrollViewMain.showsHorizontalScrollIndicator = false
        scrollViewMain.showsVerticalScrollIndicator = false
        scrollViewMain.isPagingEnabled = true
        scrollViewMain.delegate = self
        scrollViewMain.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        self.view.addSubview(scrollViewMain)
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0121112
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(SecondViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        scrollViewMain.addSubview(naviButton)
        
        // ScrollView1（真ん中の黒部分）に貼り付けるLabelの生成
        for i in 0 ..< pageSize {
            
            // ページごとに異なるラベルを表示
            let myLabel: UILabel = UILabel(frame: CGRect(x: CGFloat(i)*width+width/2-40, y: height/2 - 40, width: 80, height: 80))
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 40.0
            
            scrollViewMain.addSubview(myLabel)
        }
        
        // ScrollView2（上の赤部分）に貼り付けるLabelの生成
        for i in 0 ..< pageSize {
            
            let myLabel: UILabel = UILabel(frame: CGRect(x: CGFloat(i)*width/4, y: 50, width: 80, height: 60))
            myLabel.backgroundColor = UIColor.red
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 30.0
            
            scrollViewHeader.addSubview(myLabel)
        }
        
        // PageControlを作成
        pageControl = UIPageControl(frame: CGRect(x:0, y: self.view.frame.maxY - 50, width: width, height: 50))
        pageControl.backgroundColor = UIColor.lightGray
        
        // PageControlするページ数を設定
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        self.view.addSubview(pageControl)
        
    }
    
    // ScrollViewが移動した際に呼ばれる
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollViewMain {
            scrollViewHeader.contentOffset.x = scrollViewMain.contentOffset.x/4
        }
    }
    
    // 移動が完了したら呼ばれる
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら
        if fmod(scrollViewMain.contentOffset.x, scrollViewMain.frame.maxX) == 0 {
            
            // ページの場所を切り替える
            pageControl.currentPage = Int(scrollViewMain.contentOffset.x / scrollViewMain.frame.maxX)
        }
    }

    @objc func onClickNaviButton(sender: UIButton) {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
}
