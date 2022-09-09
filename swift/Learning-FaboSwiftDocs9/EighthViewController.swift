//
//  EighthViewController.swift
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

class EighthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var myCollectionView_2: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 50, height: 50)
        
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 32,right: 16)
        
        layout.headerReferenceSize = CGSize(width: 100, height: 50)
        
        myCollectionView_2 = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        myCollectionView_2.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell_3")
        myCollectionView_2.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section")
        
        myCollectionView_2.delegate = self
        myCollectionView_2.dataSource = self
        
        self.view.addSubview(myCollectionView_2)
        
        // Do any additional setup after loading the view.
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num:\(indexPath.row)")
        print("Value: \(indexPath.section)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch(section) {
        case 0:
            return 5
        case 1:
            return 8
        case 2:
            return 15
        default:
            print("error")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section", for: indexPath)
        
        headerView.backgroundColor = UIColor.white
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell_3", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        
        // SectionごとにCellのプロパティを変える
        switch(indexPath.section) {
        case 0:
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "0"
            
        case 1:
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "1"
            
        case 2:
            cell.backgroundColor = UIColor.blue
            cell.textLabel?.text = "2"
            
        default:
            print("section error")
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }

}
