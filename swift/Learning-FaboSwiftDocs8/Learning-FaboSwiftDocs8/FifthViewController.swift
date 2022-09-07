//
//  FifthViewController.swift
//  Learning-FaboSwiftDocs8
//
//  Created by 小室沙央里 on 2022/09/07.
//
// ①UIViewにトランジションをつける(ViewController)
// ②タッチイベントの有効/無効を切り替える(ViewController)
// ③GestureRecognizerのイベント取得(SecondViewController)
// ④UIAlertControllerをパスワード形式にする(ThirdViewController)
// ⑤UIAlertControllerで文字数制限を設ける（ThirdViewController）
// ⑥TableViewのボタンの拡張(FourthViewController)
// ⑦UITableViewをSlideさせる(FifthViewController)
// ⑧UITableViewに追加・削除機能を追加(SixthViewController)

import UIKit

class FifthViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    
    // TableViewのアイテム
    let myItems:[[String]] = [["Test1", "Test2", "Test3"], ["App1", "App2", "App3", "App4", "App5"]]
    
    // TableViewに表示するタイトル
    let myTitles:[String] = ["title0", "title1"]
    
    // TableView
    var myTableView: [UITableView] = []

    // ページ番号
    let pageSize = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fifth View"
        self.view.backgroundColor = UIColor.white
        
        // ScrollViewの設定(?)
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
    
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        self.view.addSubview(scrollView)
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Viewの高さと幅を取得
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成
        for i in 0 ..< pageSize {
            let tableView: UITableView = UITableView(frame: CGRect(x: CGFloat(i) * width, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.append(tableView)
            myTableView[i].register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
            myTableView[i].dataSource = self
            myTableView[i].delegate = self
            scrollView.addSubview(myTableView[i])
            
            // ページ毎に異なるラベルを表示
            let myLabel: UILabel = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 - 40, y: height/2 - 40, width: 80, height: 80))
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 40.0
            
            scrollView.addSubview(myLabel)
            
            let buttonWidth: CGFloat = 100
            let buttonHeight: CGFloat = 50
            let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
            let posY: CGFloat = 600
            
            let naviButton_5 = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
            naviButton_5.backgroundColor = UIColor.orange
            naviButton_5.layer.masksToBounds = true
            naviButton_5.layer.cornerRadius = 20.0
            naviButton_5.setTitle("Next", for: .normal)
            naviButton_5.addTarget(self, action: #selector(FifthViewController.onClickNaviButton_5(sender:)), for: .touchUpInside)
            self.view.addSubview(naviButton_5)
            
        }
        
        // PageControlを作成
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.maxY - 50, width: width, height: 50))
        pageControl.backgroundColor = UIColor.lightGray
        
        // PageControlするページを設定
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        self.view.addSubview(pageControl)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら（要CHK）
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
          // ページの場所を切り替える
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    // Cellが選択されたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == myTableView[0] {
            print("Num:\(indexPath.row)")
            print("Value: \(myItems[0][indexPath.row])")
        } else if tableView == myTableView[1] {
            print("Num:\(indexPath.row)")
            print("Value: \(myItems[1][indexPath.row])")
        }
    }
    
    // Cellの総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableView[0] {
            return myItems[0].count
        } else if tableView == myTableView[1] {
            return myItems[1].count
        } else {
            return 0
        }
    }
    
    // Headerを追加
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        
        myLabel.textAlignment = .center
        
        if tableView == myTableView[0] {
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.text = myTitles[0]
        } else if tableView == myTableView[1] {
            myLabel.backgroundColor = UIColor.blue
            myLabel.textColor = UIColor.white
            myLabel.text = myTitles[1]
        }
        return myLabel
    }

    // Headerの高さ(title0,title1の厚さ)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    // Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        if tableView == myTableView[0] {
            cell.textLabel?.text = "\(myItems[0][indexPath.row])"
        } else if tableView == myTableView[1] {
            cell.textLabel?.text = "\(myItems[1][indexPath.row])"
        }
        
        return cell
    }

    @objc internal func onClickNaviButton_5(sender: UIButton) {
        
        let sixthViewController = SixthViewController()
        self.navigationController?.pushViewController(sixthViewController, animated: true)
    }
    
}
