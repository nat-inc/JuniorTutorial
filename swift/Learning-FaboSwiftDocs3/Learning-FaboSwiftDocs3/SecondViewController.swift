//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs3
//
//  Created by 小室沙央里 on 2022/08/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Controllerのタイトルを設定
        self.title = "My Second View"
        
        // Viewの背景色
        self.view.backgroundColor = UIColor.green
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
