//
//  ViewController.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var myImageView: UIImageView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色を設定
        self.view.backgroundColor = UIColor.cyan
        
        //tabBarItemのアイコンをFeaturedに。タグを1と定義する。
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let iWidth: CGFloat = 300
        let posX: CGFloat = (self.view.bounds.width - iWidth)/2
        
        
        let myImage: UIImage = UIImage(named: "donutAndCoffee")!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

