//
//  SixthViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/09.
//

import UIKit

class SixthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var myCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Sixth View"

        // CollectionViewのレイアウトを生成
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさ
        layout.itemSize = CGSize(width: 50, height: 50)
        
        // Cellのマージン
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 32, right: 16)
        
        // セクション毎のヘッダーサイズ
        layout.headerReferenceSize = CGSize(width: 100, height: 30)
        
        // CollectionViewを生成
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.backgroundColor = UIColor.black
        
        self.view.addSubview(myCollectionView)
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0121112
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(SixthViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        myCollectionView.addSubview(naviButton)
    }
    
    // Cellが選択された際に呼び出される
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num:\(indexPath.row)")
        print("Value:\(collectionView)")
    }
    
    
    // ※必須　Cellの総数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // ※必須　Cellに値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let seventhViewController = SeventhViewController()
        self.navigationController?.pushViewController(seventhViewController, animated: true)
    }

}
