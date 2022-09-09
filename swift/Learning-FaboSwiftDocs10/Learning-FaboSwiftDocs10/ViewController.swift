//
//  ViewController.swift
//  Learning-FaboSwiftDocs10
//
//  Created by 小室沙央里 on 2022/09/09.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var myImagePicker: UIImagePickerController!
    var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Select a Image"
        myImageView = UIImageView(frame: self.view.bounds)
        
        // インスタンス作成
        myImagePicker = UIImagePickerController()
        
        myImagePicker.delegate = self
        
        // 画像の取得先をライブラリに
        myImagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        // 画像取得後の編集を不可に
        myImagePicker.allowsEditing = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.present(myImagePicker, animated: true, completion: nil)
    }

    // 画像が選択された時に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 選択された画像を取得
        let myImage: AnyObject? = info[UIImagePickerController.InfoKey.originalImage] as AnyObject
        
        // 選択された画像を表示するViewControllerを生成
        let secondViewController = SecondViewController()
        
        // 選択された画像を表示するViewControllerにセットする
        secondViewController.mySelectedImage = myImage as? UIImage
        
        myImagePicker.pushViewController(secondViewController, animated: true)
        
    }
    
    // 画像選択がキャンセルされたときに呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }
}

