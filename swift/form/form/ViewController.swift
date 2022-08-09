//
//  ViewController.swift
//  form
//
//  Created by 小室沙央里 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    
    //2
    private var myButton: UIButton!
    
    //3
    private var myInfoDarkButton: UIButton!
    private var myInfoLightButton: UIButton!
    private var myAddButton: UIButton!
    private var myDetailButton: UIButton!
    private var mySystemButton: UIButton!
    
    //4
    private var myTextField: UITextField!
    
    //5
    private var myImageView: UIImageView!
    
    //6
    private var myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    private var myTableView: UITableView! //Tableで使用する配列を設定する
    
    
    override func viewDidLoad() {
        //画面がロード（つまり読み込まれた際に）、{}の中に書かれていることを実行する、という操作の取り決め
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //1
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50   //ボタンのサイズを定義
        
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/2 - bHeight/2   //配置する座標を定義（画面の中心）
        
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))  //Labelを作成
        label.backgroundColor = UIColor.orange  //UILabelの背景をオレンジ色に
        label.layer.masksToBounds = true  // UILabelの枠を丸くする
        label.layer.cornerRadius = 20.0 //丸くするコーナーの半角
        label.textColor = UIColor.white
        label.text = "Hello Swift!!"
        label.shadowColor = UIColor.gray //文字の影をグレーに定義
        label.textAlignment = NSTextAlignment.center //Textを中央寄せにする
        self.view.backgroundColor = UIColor.cyan  //Viewの背景を青にする
        self.view.addSubview(label)  //ViewにLabelを追加
        
        //2
        myButton = UIButton() //Buttonを生成する
        
        let posX1: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY1: CGFloat = self.view.bounds.height/1.5 - bHeight/2
        
        myButton.frame = CGRect(x: posX1, y: posY1, width: bWidth, height: bHeight) //ボタンの設置座標とサイズを設定する
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("ボタン(通常)", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)  //タイトルを設定(通常時)
        myButton.setTitle("ボタン(押された時)", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)  //タイトルを設定(ボタンがハイライトされた時)
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
        
        //3
        myInfoDarkButton = UIButton(type: .infoDark)
        myInfoLightButton = UIButton(type: .infoLight)
        myAddButton = UIButton(type: .contactAdd)
        myDetailButton = UIButton(type: .detailDisclosure)
        mySystemButton = UIButton(type: .system) //ボタンを生成
        
        let posX2: CGFloat = self.view.frame.width/2
        myInfoDarkButton.layer.position = CGPoint(x: posX2, y: 50)
        myInfoLightButton.layer.position = CGPoint(x: posX2, y: 100)
        myAddButton.layer.position = CGPoint(x: posX2, y: 150)
        myDetailButton.layer.position = CGPoint(x: posX2, y: 200) //ボタンの位置を指定
        
        let sWidth: CGFloat = 200
        let sHeight: CGFloat = 50  //Systemボタンのサイズ
        let sposX: CGFloat = self.view.frame.width/2 - sWidth/2
        let sposY: CGFloat = 250  //Systemボタンに配置するx,y座標位置
    
        mySystemButton.frame = CGRect(x: sposX, y: sposY, width: sWidth, height: sHeight)
        //Systemボタンに配置するx,y座標とサイズを設定
        
        mySystemButton.setTitle("MySystemButton", for: .normal) //Systemボタンにタイトルを設定する
        
        myInfoDarkButton.tag = 2
        myInfoLightButton.tag = 3
        myAddButton.tag = 4
        myDetailButton.tag = 5
        mySystemButton.tag = 6
       
        myInfoDarkButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchDown)
        myInfoLightButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchDown) //イベントを追加する
        
        self.view.addSubview(myInfoDarkButton)
        self.view.addSubview(myInfoLightButton)
        self.view.addSubview(myAddButton)
        self.view.addSubview(myDetailButton)
        self.view.addSubview(mySystemButton) //ボタンをViewに追加する
        
        //4
        let tWidth: CGFloat = 200
        let tHeight: CGFloat = 30
        let posX3: CGFloat = (self.view.bounds.width - tWidth)/2
        let posY3: CGFloat = (self.view.bounds.height - tHeight)/1.7 //UITextFieldの配置するx,yと幅と高さを設定
        
        myTextField = UITextField(frame: CGRect(x: posX3, y: posY3, width: tWidth, height: tHeight))
        
        myTextField.text = "Hello TextField" //表示する文字を代入
        
        myTextField.delegate = self //Delegateを自身に設定する　//???
        myTextField.borderStyle = .roundedRect //枠を表示する
        myTextField.clearButtonMode = .whileEditing //クリアボタンを追加
        self.view.addSubview(myTextField)
        
        //5
        let iWidth: CGFloat = 100
        let iHeight: CGFloat = 100 //UIImageViewのサイズを設定
        
        let posX4: CGFloat = (self.view.bounds.width - iWidth)/2
        let posY4: CGFloat = (self.view.bounds.height - iHeight)/2.5 //UIImageViewを作成
        
        myImageView = UIImageView(frame: CGRect(x: posX4, y:posY4, width: iWidth, height: iHeight))
        //UIImageViewを作成
        
        let myImage: UIImage = UIImage(named: "logoyotuba02.png")! //UIimageを作成
        
        myImageView.image = myImage
        
        self.view.addSubview(myImageView)
        
        //6
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        //Status Barの高さを取得
        
        let displayWidth: CGFloat = self.view.frame.width/2.5
        let displayHeight: CGFloat = self.view.frame.height/2
        //Viewの高さと幅を取得
        
        myTableView = UITableView(frame: CGRect(x: 5, y: barHeight, width: displayWidth, height: displayHeight/3))
        //TableViewの生成
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        //Cell名の登録を行う
        
        myTableView.dataSource = self
        //DataSourcewを自身に設定する
        
        myTableView.delegate = self
        //Delegateを自身に設定する
        
        self.view.addSubview(myTableView)
        
        
    }
    
    
    @objc internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:")
        print("sender.currentTitle: \(sender.currentTitle)")
        print("sender.tag: \(sender.tag)")
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    } //OSが自動的に呼び出すメソッド。 実行中のアプリがiPhoneのメモリを使いすぎた際に呼び出される。このメソッドの中に不要なメモリを解放するコードを書いておけば、アプリのクラッシュを未然に防ぐことができる。
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField)  -> Bool{
        print("textFieldShouldReturn: \(textField.text!)")

        //改行ボタンが押されたらKeyboardを閉じる処理
        textField.resignFirstResponder()

        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }  //Cellが選択されたときに呼び出される
    
    func tableView(_ tableVIew: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }  //Cellの総数を返す
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) //再利用するCellを取得
        cell.textLabel!.text = "\(myItems[indexPath.row])" //Cellに値を設定
        
        return cell
    }
   
    

}
