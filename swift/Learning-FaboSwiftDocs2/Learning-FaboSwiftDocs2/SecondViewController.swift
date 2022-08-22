//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs2
//
//  Created by 小室沙央里 on 2022/08/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        
        let backButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        backButton.backgroundColor = UIColor.red
        backButton.layer.masksToBounds = true
        backButton.setTitle("Back", for: .normal)
        backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        backButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        // Do any additional setup after loading the view.
    }
    
    @objc internal func onClickMyButton(sender: UIButton) {
        
        //遷移するViewを定義
        let myViewController: UIViewController = ViewController()
        
        //アニメーションを設定
        myViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        //Viewの移動
        self.present(myViewController, animated: true, completion: nil)
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
