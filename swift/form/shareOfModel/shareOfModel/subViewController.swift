//
//  subViewController.swift
//  shareOfModel
//
//  Created by 小室沙央里 on 2022/08/03.
//

import UIKit

class subViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan
        
        let openButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width:  120, height: 50))
        openButton.backgroundColor = UIColor.blue
        openButton.setTitle("open", for: .normal)
        openButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        openButton.addTarget(self, action: #selector(onClickOpenButton(sender:)), for: .touchUpInside)
        self.view.addSubview(openButton);
        
        // Do any additional setup after loading the view.
    }
    
    @objc internal func onClickOpenButton(sender: UIButton){
        
        let myViewController = ViewController()
        self.navigationController?.pushViewController(myViewController, animated: true)
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
