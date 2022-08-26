//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/24.
// ①UITabBarControllerでタブの表示(First)
// ②UIImageViewで画像を表示
// ③UIScrollViewの表示(Second)
// ④UITextViewで複数行のテキストの表示(First)

import UIKit

class SecondViewController: UIViewController {
    // ①
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.green
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // --③--
    private var myScrollView: UIScrollView!
    
    // --③,⑤--
    private let myImage = CIImage(image: UIImage(named: "temple.jpeg")!)
    private var myImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ScrollViewを生成
        myScrollView = UIScrollView()
        
        // ScrollViewの大きさを設定
        myScrollView.frame = self.view.frame
        
        // --③,⑤--
      
        myImageView = UIImageView()
        myImageView.image = UIImage(ciImage: myImage!)
        
        // frameの値を設定
        myImageView.frame = myScrollView.frame
        
        // 画像のアスペクト比を設定
        myImageView.contentMode = UIView.ContentMode.scaleAspectFill
        
        // ScrollViewにmyImageViewを追加
        myScrollView.addSubview(myImageView)
        
        
        
        // Scrollの高さを計算しておく(※!をつける)
        let scroll_height = myImageView.image!.size.height*(self.view.frame.width/myImageView.image!.size.width)
        
        // ViewにScrollViewをAddする
        self.view.addSubview(myScrollView)
        
        // ScrolleViewにcontentSizeを設定
        myScrollView.contentSize = CGSize(width: self.view.frame.width, height: scroll_height)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
