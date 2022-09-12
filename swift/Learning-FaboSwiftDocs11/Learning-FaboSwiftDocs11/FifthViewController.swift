//
//  FifthViewController.swift
//  Learning-FaboSwiftDocs11
//
//  Created by 小室沙央里 on 2022/09/12.
//
// ①UIImageで画像の透過(ViewController)
// ②UIImageをぼかす(SecondViewController)
// ③UIImageをリサイズする(ViewController)
// ④UIImageを合成する(ThirdViewController)
// ⑤UIViewからUIImageを取得する（スクリーンショット）(FourthViewController)
// ⑥UITextCheckerでスペルチェック(FifthViewController)
// ⑦UIViewにアタッチメントを適用させる(SixthViewController)
// ⑧UIViewに重力を適用させる(SixthViewController)
// ⑨UIViewをスナップさせる(SixthViewController)
// ⑩UIviewを動的に動かす(SixthViewController)

import UIKit

class FifthViewController: UIViewController {

    var myTextField: UITextField!
    var suggestedTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Fifth View"
        self.view.backgroundColor = UIColor.white
        
        let naviButton = UIButton()
        naviButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        naviButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        naviButton.backgroundColor = UIColor.green
        naviButton.layer.masksToBounds = true
        naviButton.layer.cornerRadius = 20.0
        naviButton.setTitle("ボタン", for: .normal)
        naviButton.addTarget(self, action: #selector(FourthViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        self.view.addSubview(naviButton)
        
        let myButton = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 40))
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.setTitle("チェックする", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        myButton.addTarget(self, action: #selector(FifthViewController.onClickMyButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(myButton)
        
        // スペル入力用TextField生成
        myTextField = UITextField(frame: CGRect(x:0, y:0, width: 200, height: 30))
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y:100)
        self.view.addSubview(myTextField)
        
        // 候補用UITextView生成
        suggestedTextField = UITextView(frame: CGRect(x:0, y:0, width: 300, height: 250))
        suggestedTextField.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY + 150)
        suggestedTextField.backgroundColor = UIColor.black
        suggestedTextField.textColor = UIColor.white
        suggestedTextField.textAlignment = NSTextAlignment.left
        suggestedTextField.text = "もしかして"
        suggestedTextField.font = UIFont.systemFont(ofSize: CGFloat(20))
        suggestedTextField.isEditable = false
        self.view.addSubview(suggestedTextField)
        
    }
    
    // ボタンが押されたときに呼ばれるメソッド
    @objc func onClickMyButton(sender: UIButton) {
        
        suggestUpdate()
    }
    
    // スペルチェックのメソッド
    @objc func suggestUpdate() {
        
        // UITextCheckerの宣言
        let checker: UITextChecker = UITextChecker()
        
        // textの文字数取得
        let length = myTextField.text?.count
        
        // スペルチェックする範囲（0~入力された文字数）を指定
        let checkRange: NSRange = NSMakeRange(0, length!)
        
        // 範囲の中から間違ったスペルを探す
        let misspelledRange: NSRange = checker.rangeOfMisspelledWord(
            
            // チェックする文字指定
            in: myTextField.text!,
            
            // チェックする範囲指定
            range: checkRange,
            
            // 開始位置を範囲の先頭に指定
            startingAt: checkRange.location,
            
            // 指定された範囲内にミスが見つからなくてもrangeの開始位置から探し始める（falseならミスが見つからなかった末尾の位置を保持）
            wrap: true,
            
            // 言語を英語に指定
            language: "en_US")
        
        // スペルミスが見つかった場合
        if misspelledRange.location != NSNotFound {
            
            // 正しいスペルの候補を取得
            let candidateArray: NSArray = checker.guesses(
                
                // スペルミスがある範囲
                forWordRange: misspelledRange,
                
                // スペルミスを含む文字(range内)
                in: myTextField.text!,
                
                // 言語を英語に指定
                language: "en_US")! as NSArray
            
            var str = "もしかして:\n"
            
            for text in candidateArray {
                str += (text as AnyObject).description!
                str += ", "
            }
            suggestedTextField?.text = str
        }
        
    }

    @objc func onClickNaviButton(sender: UIButton) {
        let sixthViewController = SixthViewController()
        self.navigationController?.pushViewController(sixthViewController, animated: true)
    }
}
