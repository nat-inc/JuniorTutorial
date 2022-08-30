//
//  ViewController.swift
//  Learning-FaboSwiftDocs5
//
//  Created by 小室沙央里 on 2022/08/29.
//  ①UIPageControlの表示
//  ②UISwitchの表示
//  ③UIDatePickerの表示
//  ④UIActivityIndicatorの表示


import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate {

    // ①
    private var pageControl: UIPageControl!
    private var scrollView: UIScrollView!
    
    // ②
    private var myLabel: UILabel!
    
    // ③
    private var myTextField: UITextField!
    
    // ④
    private var myActivityIndicator: UIActivityIndicatorView!
    private var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = self.view.frame.maxX
        let height = self.view.frame.maxY
        
        self.view.backgroundColor = UIColor.cyan
        
        // ①
        // ScrollViewを取得
        scrollView = UIScrollView(frame: self.view.frame)
        
        // ページ数を定義
        let pageSize = 4
        
        // 縦方向と、横方法のインディケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    
        // ページングを許可する
        scrollView.isPagingEnabled = true
        
        // ScrollViewのデリゲートを設定
        scrollView.delegate = self
        
        //スクロールの画面サイズを指定
        scrollView.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        
        self.view.addSubview(scrollView)
        
        // ページ数分ボタンを生成する
        for i in 0 ..< pageSize {
            // ページごとに異なるラベルを生成
            let myLabel: UILabel = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 + 50, y: height/2 - 40, width: 80, height: 80))
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
        
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 40.0
            
            scrollView.addSubview(myLabel)
        }
        
        // PageControlを作成
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.maxY - 100, width: width, height: 50))
        pageControl.backgroundColor = UIColor.orange

        // PageControlするページ数を設定
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        self.view.addSubview(pageControl)
        
        // ②
        // Swicthを作成
        let mySwicth: UISwitch = UISwitch()
        mySwicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 500)
        
        // Switchの枠線を表示
        mySwicth.tintColor = UIColor.black
        
        // SwitchをOnに設定する
        mySwicth.isOn = true
        
        // SwitchのOn/Off切り替わりの際に、呼ばれるイベントを設定
        mySwicth.addTarget(self, action: #selector(ViewController.onClickMySwitch(sender:)), for: UIControl.Event.valueChanged)
       
        self.view.addSubview(mySwicth)
        
        // On/Offを表示するラベルを作成
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        myLabel.backgroundColor = UIColor.orange
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 75.0
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.font = UIFont.systemFont(ofSize: 30.0)
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        myLabel.text = "On"
        
        self.view.addSubview(myLabel)
        
        // ③
        // DatePickerを生成
        let myDatePicker: UIDatePicker = UIDatePicker()
        
        // DataPickerを設定（デフォルトでは位置は画面上部）する
        myDatePicker.frame = CGRect(x: 0, y:480, width: self.view.frame.width, height: 200)
        myDatePicker.timeZone = NSTimeZone.local
        myDatePicker.backgroundColor = UIColor.white
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        
        // 値が変わった際のイベント登録
        myDatePicker.addTarget(self, action: #selector(ViewController.onDidChangeDate(sender:)), for: .valueChanged)
        
        self.view.addSubview(myDatePicker)
        
        // UITextFieldを作成
        myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        myTextField.text = ""
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 130)
        
        self.view.addSubview(myTextField)
        
        // ④
        // インジケータを作成
        myActivityIndicator = UIActivityIndicatorView()
        myActivityIndicator.frame = CGRect(x:0, y:0, width: 50, height: 50)
        myActivityIndicator.center = self.view.center
        
        // アニメーションが停止している時もインジケータを表示させる
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.style = UIActivityIndicatorView.Style.white
        
        // アニメーションを開始
        myActivityIndicator.stopAnimating()
        
        self.view.addSubview(myActivityIndicator)
        
        myButton = UIButton(frame: CGRect(x:0, y:0, width: 60, height: 60))
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 30.0
        myButton.setTitle("Stop", for: .normal)
        myButton.layer.position = CGPoint(x: self.view.bounds.width/4, y: self.view.bounds.height/2)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
}

    
    // ①
    @objc internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になった時
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            //ページの場所を切り替える
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    // ②
    @objc internal func onClickMySwitch(sender: UISwitch) {
        
        if sender.isOn {
            myLabel.text = "On"
            myLabel.backgroundColor = UIColor.orange
        }else{
            myLabel.text = "Off"
            myLabel.backgroundColor = UIColor.gray
        }
    }
    
    // ③
    @objc internal func onDidChangeDate(sender: UIDatePicker) {
        //フォーマット作成
        let myDateFormatter: DateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        
        // 日付をフォーマットに沿って取得
        let mySelectedDate: NSString = myDateFormatter.string(from: sender.date) as NSString
        myTextField.text = mySelectedDate as String
    }
    
    // ④
    @objc internal func onClickMyButton(sender: UIButton) {
        
        if myActivityIndicator.isAnimating {
            myActivityIndicator.stopAnimating()
            myButton.setTitle("Start", for: .normal)
            myButton.backgroundColor = UIColor.blue
        }
        else {
            myActivityIndicator.startAnimating()
            myButton.setTitle("Stop", for: .normal)
            myButton.backgroundColor = UIColor.red
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
