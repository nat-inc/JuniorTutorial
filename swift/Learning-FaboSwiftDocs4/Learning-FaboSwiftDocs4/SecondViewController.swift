//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/24.
//

import UIKit

class SecondViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
