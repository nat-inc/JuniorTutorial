//
//  FifthViewController.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/08.
//

import UIKit

class FifthViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fifth View"
        self.view.backgroundColor = UIColor.green
        
        // SegmentedControllerを生成
        let mySegcon = UISegmentedControl(items: ["Circle", "Rectangle", "Line"])
        mySegcon.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blue
//        mySegcon.addTarget(self, action: #selector(ViewController.changedValue(sender:)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(mySegcon)
        
        
        // Do any additional setup after loading the view.
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
