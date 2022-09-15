//
//  Login1_ViewController.swift
//  UI_v1_1
//
//  Created by 小室沙央里 on 2022/09/15.
//

import UIKit

extension UIColor {
    // 線色
    @nonobjc class var tealBlue: UIColor {
        return UIColor(red: 0.0, green: 171.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
    }
}

extension UITextField {
    func setUnderLine() {
        borderStyle = .none
        let underline = UIView()
        underline.frame = CGRect(x:0, y:frame.height, width: frame.width, height: 1.0)
        underline.backgroundColor = UIColor.tealBlue
        addSubview(underline)
        bringSubviewToFront(underline)
    }
}

class Login1_ViewController: UIViewController, UITextFieldDelegate {

    private var logoImageView: UIImageView!
    private var buildingsImageView: UIImageView!
    private var emailField: UITextField!
    private var emailField_check: UITextField!
    private var pwField: UITextField!
    private var pwField_check: UITextField!
    private var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login1"
        self.view.backgroundColor = UIColor.white
        
        // logoImageView
        let iWidth: CGFloat = 203
        let iHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - iWidth)/2
        let posY: CGFloat = (self.view.bounds.height - iHeight)/7
        
        let logoImage: UIImage = UIImage(named: "logo.png")!
        logoImageView = UIImageView(frame: CGRect(x: posX, y: posY, width: iWidth, height: iHeight))
        logoImageView.image = logoImage
        logoImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.view.addSubview(logoImageView)
        
        // buildinImageView (要修正)
        let iWidth_2: CGFloat = 768
        let iHeight_2: CGFloat = 144.5
//        let posX_2: CGFloat = (self.view.bounds.width - iWidth_2)/2
//        let posY_2: CGFloat = (self.view.bounds.height - iHeight_2)/7
        
        let buildingsImage: UIImage = UIImage(named: "login_buildings.png")!
        buildingsImageView = UIImageView(frame: CGRect(x: 0, y:879.5, width: self.view.frame.maxX, height: iHeight_2))
        buildingsImageView.image = buildingsImage
        buildingsImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.view.addSubview(buildingsImageView)
        
        
        // textField
        let tWidth: CGFloat = view.frame.width - (view.frame.maxX/3)
        let tHeight: CGFloat = 50
        let tX: CGFloat = (self.view.bounds.width - tWidth)/2
        let tY: CGFloat = (self.view.bounds.height - tHeight)/4
        
        emailField = UITextField(frame: CGRect(x: tX, y: tY, width: tWidth, height: tHeight))
        emailField.placeholder = "メールアドレスを入力してください"
        emailField.delegate = self
        emailField.textAlignment = NSTextAlignment.center
        emailField.setUnderLine()
        self.view.addSubview(emailField)
        
        emailField_check = UITextField(frame: CGRect(x: tX, y :tY + 80, width: tWidth, height: tHeight))
        emailField_check.placeholder = "右の確認コード送信ボタンを押してください"
        emailField_check.delegate = self
        emailField_check.textAlignment = NSTextAlignment.center
        emailField_check.setUnderLine()
        self.view.addSubview(emailField_check)
        
        pwField = UITextField(frame: CGRect(x: tX, y :tY + 160, width: tWidth, height: tHeight))
        pwField.placeholder = "パスワードを設定してください"
        pwField.delegate = self
        pwField.textAlignment = NSTextAlignment.center
        pwField.setUnderLine()
        self.view.addSubview(pwField)
        
        pwField_check = UITextField(frame: CGRect(x: tX, y :tY + 240, width: tWidth, height: tHeight))
        pwField_check.placeholder = "上記と同じパスワードを設定してください"
        pwField_check.delegate = self
        pwField_check.textAlignment = NSTextAlignment.center
        pwField_check.setUnderLine()
        self.view.addSubview(pwField_check)
        
        // 登録ボタン
        registerButton = UIButton()
       
        registerButton.frame = CGRect(x: tX, y: (self.view.bounds.height)*3/5, width: tWidth, height: tHeight)
        registerButton.backgroundColor = UIColor.tealBlue
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 10.0
        registerButton.setTitle("登録", for: UIControl.State.normal)
        registerButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(registerButton)
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
