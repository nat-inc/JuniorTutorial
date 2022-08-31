//
//  ViewController.swift
//  Learning-FaboSwiftDocs6
//
//  Created by 小室沙央里 on 2022/08/30.
//  ①セクション分けしたUITableViewを作る
//  ②UITextFieldに文字数制限を設ける
//  ③UITextFieldの入力をパスワード形式にする
//  ④UIBarButtonItemの追加
//  ⑤UISearchBarの表示
//  ⑥UIProgressViewで進捗の具合の確認
//  ⑦UINavigationControllerの表示
//  ⑧UIWindowの表示


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate {

    // ①Tableで使用する配列を定義
    private let myFruits:NSArray = ["apple", "banana", "strawberry" ]
    private let myColors:NSArray = ["green", "blue", "red"]
    
    // ①Sectionで使用する配列を定義
    private let mySections:NSArray = ["Fruits", "Colors"]
    
    // ④
    private var myLeftButton: UIBarButtonItem!
    private var myRightButton: UIBarButtonItem!
    
    // ⑤
    private var mySearchBar: UISearchBar!
    private var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.cyan
        
        // ①
        // Status Barの高さを取得
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Viewの高さと幅を取得
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height/2
        
        // TableViewの生成（Status barの高さ分ずらして表示）
        let myTableView: UITableView = UITableView(frame: CGRect(x:0,y:barHeight, width: displayWidth, height: displayHeight))
        
        // Cell名の登録
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        self.view.addSubview(myTableView)
        
        // ②
        let myTextField: UITextField = UITextField(frame: CGRect(x:0, y:0, width: 200, height: 20))
        myTextField.text = "Hello"
        myTextField.delegate = self
        
        // 枠の線を表示
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height-100)
        self.view.addSubview(myTextField)
        
        // ③
        let pwTextField: UITextField = UITextField(frame: CGRect(x:0, y:0, width: 200, height: 20))
        pwTextField.delegate = self
        pwTextField.borderStyle = UITextField.BorderStyle.roundedRect
        pwTextField.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-150)
        
        // 入力された文字を非表示モードにする
        pwTextField.isSecureTextEntry = true
        self.view.addSubview(pwTextField)
        
        // ④
        self.title = "My First Navigation"
        
        myLeftButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.onClickMyButton(sender:)))
        
        myRightButton = UIBarButtonItem(title: "RightBtn", style: .plain, target: self, action: #selector(ViewController.onClickMyButton(sender:)))
        
        myLeftButton.tag = 1
        myRightButton.tag = 2
        
        // ナビゲーションバーの左に
        self.navigationItem.leftBarButtonItem = myLeftButton
        
        // ナビゲーションバーの右に設置
        self.navigationItem.rightBarButtonItem = myRightButton
        
        // ⑤
        // 検索バー作成
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(x:0, y:0, width: 300, height: 80)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-300)
        
        // 影をつける
        mySearchBar.layer.shadowColor = UIColor.black.cgColor
        mySearchBar.layer.shadowOpacity = 0.5
        mySearchBar.layer.masksToBounds = false
        
        // キャンセルボタンを有効に
        mySearchBar.showsCancelButton = true
        
        // ブックマークボタンを無効に
        mySearchBar.showsBookmarkButton = false
        
        // バースタイルをDefaultに設定
        mySearchBar.searchBarStyle = UISearchBar.Style.default
        
        // タイトルを設定
        mySearchBar.prompt = "タイトル"
        
        // 説明文を設定する
        mySearchBar.placeholder = "ここに入力してください"
        
        // カーソル、キャンセルボタンの色を設定
        mySearchBar.tintColor = UIColor.red
        
        // 検索結果表示ボタンを非表示に
        mySearchBar.showsSearchResultsButton = false
        
        self.view.addSubview(mySearchBar)
        
        myLabel = UILabel(frame: CGRect(x:0, y:0, width: 200, height: 30))
        myLabel.center = CGPoint(x:self.view.frame.width/2, y:self.view.bounds.height-230)
        myLabel.text = ""
        myLabel.layer.borderWidth = 1.0
        myLabel.layer.borderColor = UIColor.gray.cgColor
        myLabel.layer.cornerRadius = 10.0
        
        self.view.addSubview(myLabel)
        
        // ⑥
        // ProgressViewを作成
        let myProgressView: UIProgressView = UIProgressView(frame: CGRect(x:0, y:0, width: 200, height: 10))
        myProgressView.progressTintColor = UIColor.green
        myProgressView.trackTintColor = UIColor.white
        
        myProgressView.layer.position = CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height-180)
        
        // バーの高さを設定（横に1.0倍、縦に2.0倍）
        myProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        
        // 進捗具合を設定（0.0〜1.0）
        myProgressView.progress = 0.3
        
        // アニメーションを付ける
        myProgressView.setProgress(1.0, animated: true)
        
        self.view.addSubview(myProgressView)
        
        // ⑦
        let myButton = UIButton()
        myButton.frame = CGRect(x:0, y:0, width: 100, height: 50)
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        myButton.backgroundColor = UIColor.green
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("ボタン", for: .normal)
        myButton.addTarget(self, action: #selector(ViewController.onClickNaviButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // ①
    //　セクションを返す
    func numberOfSections(in tableView: UITableView) -> Int {
        print(mySections.count)
        return mySections.count
    }

    // セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    // Cellが選択されたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value:\(myFruits[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value:\(myColors[indexPath.row])")
        }
    }
    
    // テーブルに表示する配列の総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myFruits.count
        } else if section == 1 {
            return myColors.count
        } else {
            return 0
        }
    }
    
    // Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myFruits[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myColors[indexPath.row])"
        }
        
        return cell
    }
    
    // ②
    // テキストが編集されたときに呼ばれる
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        let maxLength: Int = 6
        
        // 入力済みの文字と入力された文字を合わせて取得
        let str = textField.text! + string
        
        if str.count <= maxLength {
            return true
        }
        print("6文字を超えています")
        return false
    }
    
    // ④
    @objc internal func onClickMyButton(sender: UIButton) {
        
        switch(sender.tag) {
            
        case 1:
            self.view.backgroundColor = UIColor.blue
            
        case 2:
            self.view.backgroundColor = UIColor.red
            
        default:
            print("error")
        }
    }
    
    // ⑤
    // テキストが変更される毎に呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        myLabel.text = searchText
    }
    
    // Cancelボタンが押されたときに呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        myLabel.text = ""
        mySearchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        myLabel.text = "Searching"
        mySearchBar.text = ""
        self.view.endEditing(true)
    }
    
    // ⑦
    @objc internal func onClickNaviButton(sender: UIButton) {
        
        //移動先のViewを定義
        let secondViewController = SecondViewController()
        
        //SecondViewに移動
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    
}

