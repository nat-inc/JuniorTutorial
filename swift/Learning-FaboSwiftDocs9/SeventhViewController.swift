//
//  SeventhViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/09.
//

import UIKit

class SeventhViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var customCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Seventh View"

        // CollectionViewのレイアウトを生成
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさ
        layout.itemSize = CGSize(width: 50, height: 50)
        
        // Cellのマージン
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 32, right: 16)
        
        // セクション毎のヘッダーサイズ
        layout.headerReferenceSize = CGSize(width: 100, height: 30)
        
        // CollectionViewを生成
        customCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録
        customCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell_2")
        
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        
        customCollectionView.backgroundColor = UIColor.yellow
        
        self.view.addSubview(customCollectionView)
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 600
        
        let naviButton = UIButton(frame: CGRect(x:posX, y:posY, width: buttonWidth, height: buttonHeight))
        naviButton.backgroundColor = UIColor.orange
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("Next", for: .normal)
        naviButton.addTarget(self, action: #selector(SeventhViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        customCollectionView.addSubview(naviButton)
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num:\(indexPath.row)")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell_2", for: indexPath) as! CustomUICollectionViewCell
        cell.textLabel?.text = indexPath.row.description
        cell.layer.borderColor = UIColor.black.cgColor
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    @objc func onClickNaviButton(sender: UIButton) {
        let eighthViewController = EighthViewController()
        self.navigationController?.pushViewController(eighthViewController, animated: true)
    }
}
