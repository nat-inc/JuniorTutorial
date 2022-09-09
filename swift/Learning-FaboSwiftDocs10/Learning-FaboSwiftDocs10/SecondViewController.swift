//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs10
//
//  Created by 小室沙央里 on 2022/09/09.
//

import UIKit

class SecondViewController: UIViewController {

    var mySelectedImage: UIImage!
    var mySelectedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        setImage()
    }
    
    // 選択された画像をUIImageViewにセットする
    func setImage() {
        self.title = "Selected Image"
        
        mySelectedImageView = UIImageView(frame: self.view.bounds)
        mySelectedImageView.contentMode = UIView.ContentMode.scaleAspectFit
        mySelectedImageView.image = mySelectedImage
        self.view.addSubview(mySelectedImageView)
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
