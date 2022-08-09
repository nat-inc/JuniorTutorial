//
//  SecondViewController.swift
//  form
//
//  Created by 小室沙央里 on 2022/07/11.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 100
        
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/2 - bHeight/2
        
        let label:UILabel = UILabel(frame: CGRect(x: posX, y:posY, width:bWidth, height:bHeight))
        
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.textColor = UIColor.white
        
        self.view.addSubview(label)
        
        
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
