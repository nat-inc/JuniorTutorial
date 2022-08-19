//
//  ViewController.swift
//  training1
//
//  Created by 小室沙央里 on 2022/07/11.
//

import UIKit

extension UIImage {

    func resize(size: CGSize) -> UIImage {
        let widthRatio = size.width / self.size.width
        let heightRatio = size.height / self.size.height
        let ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio
        let resizedSize = CGSize(width: (self.size.width * ratio), height: (self.size.height * ratio))

        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
                draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
                let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
        return resizedImage!
    }
}  //画像を統一にリサイズ

struct Human{
    var name:String
    var age:Int
    var image: String
}  //Human構造体

private var ticketsView: UITableView!

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    private var tickets: Array<Human> = []{
        didSet{
            ticketsView?.reloadData()
        }
    }
    
    private var ticketsView: UITableView!
    private var myNameField: UITextField!
    private var myAgeField: UITextField!
    private var myImageView1: UIImageView!
    private var appendButton: UIButton!
    private var updateButton: UIButton!
    private var deleteButton: UIButton!
    
    var selectedRow:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var s1 = Human(name:"Alice", age:15, image: "coffee.png") //生徒
//        var s2 = Human(name:"Bob", age:15, image: "coffeeBeans.png")
//        var s3 = Human(name:"Charly", age:16, image: "donutAndCoffee.png")
//
//        tickets = [s1, s2, s3, s2, s3, s2, s3, s2, s3, s2, s3, s2, s3, s2, s3, s2, s3]
    
        //Table
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        ticketsView = UITableView(frame: CGRect(x: 0, y: 200, width: displayWidth, height: displayHeight))
    
        ticketsView.register(CoffeeTableViewCell.self, forCellReuseIdentifier: "MyCell")
        //自分で作ったカスタムセルをMyCellという名前で使うように登録
        
        ticketsView.dataSource = self
        ticketsView.delegate = self
        //プロトコルとデリゲートは他で用意されている機能を使うためのもの。
    
        ticketsView.rowHeight = 160
        
        self.view.addSubview(ticketsView)
        
        //TextField
        let tWidth: CGFloat = 200
        let tHeight: CGFloat = 30
        let posX: CGFloat = (self.view.bounds.width - tWidth)/2

        myNameField = UITextField(frame: CGRect(x: posX, y: 120, width: tWidth, height: tHeight))
        myAgeField = UITextField(frame: CGRect(x: posX, y: 70, width: tWidth, height: tHeight))
        
        myNameField.text = "Hello TextField"
        myNameField.delegate = self
        myNameField.borderStyle = .roundedRect
        myNameField.clearButtonMode = .whileEditing
        
        myAgeField.text = "20"
        myAgeField.delegate = self
        myAgeField.borderStyle = .roundedRect
        myAgeField.clearButtonMode = .whileEditing
        
        self.view.addSubview(myNameField)
        self.view.addSubview(myAgeField)
        
        //Button
        let bPosX: CGFloat = self.view.frame.width / 1.2
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        appendButton = UIButton(type: .system)
        appendButton.frame = CGRect(x: bPosX/2 , y: 170, width: bWidth / 3, height: bHeight)
        appendButton.setTitle("追加", for: .normal)
        
        updateButton = UIButton(type: .system)
        updateButton.frame = CGRect(x: bPosX/3 , y: 170, width: bWidth / 3, height: bHeight)
        updateButton.setTitle("更新", for: .normal)
        
        //ボタンにイベントを追加する
        appendButton.addTarget(self, action: #selector(ViewController.onClickAppendButton(sender:)), for: .touchDown)
        
        updateButton.addTarget(self, action:
            #selector(ViewController.onClickUpdateButton(sender:)), for:.touchDown)
        
        self.view.addSubview(appendButton)
        self.view.addSubview(updateButton)
        
    }

override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num:\(indexPath.row)")
        print("Value:\(tickets[indexPath.row])")
        print("sample") //CHK
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return tickets.count
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CoffeeTableViewCell
        cell.setCell(name: tickets[indexPath.row].name, content:"\(tickets[indexPath.row].age)")
        cell.imageView?.image = UIImage(named: tickets[indexPath.row].image)?.resize(size: CGSize(width: 100, height: 100))
        
        cell.deleteButton.tag = indexPath.row
        cell.changeButton.tag = indexPath.row
        //cellと、data（ここでいうtickets）の中のindexを一緒にする
     
        cell.deleteButton.setTitle("削除：\(indexPath.row)", for: .normal)
        cell.changeButton.setTitle("変更：\(indexPath.row)", for: .normal)
        //タイトルをつける
        
        
        cell.deleteButton.addTarget(self, action: #selector(onClickDeleteButton(sender:)), for: .touchUpInside)
        cell.changeButton.addTarget(self, action: #selector(onClickChangeButton(sender:)), for: .touchUpInside)
        //イベントをつける
        
        return cell
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
          print("textFieldDidEndEditing: \(textField.text!)")
      }
    
    //ボタンイベント(追加)
    @objc internal func onClickAppendButton(sender: UIButton){
        print("onClickAppendButton:")
        tickets.append(Human(name:myNameField.text!, age:Int(myAgeField.text!)!, image:"donutAndCoffee.png"))
    }
    
    //ボタンイベント(更新)
    @objc internal func onClickUpdateButton(sender: UIButton){
        print("onClickUpdateButton")
        print(sender.tag)
        if selectedRow != nil {
            tickets[selectedRow!].name = "\(myNameField.text!)"
            tickets[selectedRow!].age = Int(myAgeField.text!)!
        }
    }
    
    //ボタンイベント(削除)
    @objc internal func onClickDeleteButton(sender: UIButton){
        print(sender.tag)
        tickets.remove(at:sender.tag)
        // sender:tag == cell.deleteButton.tag
    }
    
    //ボタンイベント(変更)
    @objc internal func onClickChangeButton(sender: UIButton){
        print(sender.tag)
        myNameField.text = "\(tickets[sender.tag].name)"
        myAgeField.text = "\(tickets[sender.tag].age)"
        selectedRow = sender.tag
    }

}



   

