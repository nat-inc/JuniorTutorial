//
//  SecondViewController.swift
//  Learning-FaboSwiftDocs2
//
//  Created by 小室沙央里 on 2022/08/22.

// ①UIAlertControllerでアラートを表示
// ③ViewControllerで画面遷移する

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // ②UIPickerView
    private var myUIPicker: UIPickerView!
    
    // ②表示する値の配列
    private let myValues: NSArray = ["その一","その二","その三","その四"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ②UIPickerViewを生成
        myUIPicker = UIPickerView()
        myUIPicker.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180.0)
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        self.view.addSubview(myUIPicker)
        
        self.view.backgroundColor = UIColor.blue
        
        // ③戻るボタン
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ②pickerに表示する行数を返すデータソースメソッド（実装必須）
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    // ②pickerに表示する値を返すデリゲートメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }
    
    // ②pickerが選択された際に呼ばれるデリゲートメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(myValues[row])")
    }
    
    
    // ③画面遷移イベント（戻る）
    @objc internal func onClickMyButton(sender: UIButton) {
        
        //遷移するViewを定義
        let myViewController: UIViewController = ViewController()
        
        //アニメーションを設定
        myViewController.modalPresentationStyle = .fullScreen
        
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
