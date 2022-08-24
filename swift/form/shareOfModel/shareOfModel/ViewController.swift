//
//  ViewController.swift
//  shareOfModel
//
//  Created by 小室沙央里 on 2022/08/02.
//

import UIKit
import SnapKit

public struct ShareInfoDTO: Codable {
    public let shareTime: String
    public let shareUser: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    private var shareInfo:Array<ShareInfoDTO> = []{
        didSet {
            shareInfoTableView?.reloadData()
        }
    }
    
    private var shareInfoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        let s1 = ShareInfoDTO(shareTime:"2022.01.01 12:00", shareUser:"ichiro")
        let s2 = ShareInfoDTO(shareTime:"2022.01.01 12:00", shareUser:"jiro")
        let s3 = ShareInfoDTO(shareTime:"2022.01.01 12:00", shareUser:"saburo")
        shareInfo = [s1, s2, s3]
        setupViews()
        
        //データがない場合のUILabel
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/2 - bHeight/2
        
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.text = "データがありません"
        label.textAlignment = NSTextAlignment.center
        
        if shareInfo.count == 0 {
            self.view.addSubview(label)
        }
        
    }
    
    @objc internal func onClickBackButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        shareInfoTableView = UITableView()
        shareInfoTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "MyCell")
        shareInfoTableView.dataSource = self
        shareInfoTableView.delegate = self
        self.view.addSubview(shareInfoTableView)
        
        shareInfoTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(140)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
       
        //subtitlelabel
        let subTitleNumberLabel:UILabel = UILabel()
        subTitleNumberLabel.font = UIFont.systemFont(ofSize:18)
        subTitleNumberLabel.text = "番号"
        subTitleNumberLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(subTitleNumberLabel)
        
        let subTitleTimeLabel:UILabel = UILabel()
        subTitleTimeLabel.font = UIFont.systemFont(ofSize:18)
        subTitleTimeLabel.text = "シェア時間"
        subTitleTimeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(subTitleTimeLabel)
        
        let subTitleUserLabel:UILabel = UILabel()
        subTitleUserLabel.font = UIFont.systemFont(ofSize:18)
        subTitleUserLabel.text = "メールアドレス"
        subTitleUserLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(subTitleUserLabel)
        
        subTitleNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(shareInfoTableView.snp.left).offset(30)
            make.bottom.equalTo(shareInfoTableView.snp.top).offset(-3)
            make.width.equalToSuperview().multipliedBy(0.1).priority(.high)
            make.height.equalTo(50)
        }
        
        subTitleTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(subTitleNumberLabel.snp.right).offset(5)
            make.bottom.equalTo(shareInfoTableView.snp.top).offset(-3)
            make.width.equalToSuperview().multipliedBy(0.3).priority(.high)
            make.height.equalTo(50)
        }
        
        subTitleUserLabel.snp.makeConstraints { make in
            make.left.equalTo(subTitleTimeLabel.snp.right)
            make.bottom.equalTo(shareInfoTableView.snp.top).offset(-3)
            make.width.equalToSuperview().multipliedBy(0.6).priority(.high)
            make.height.equalTo(50)
        }
        
        //UIBar-Button
        let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.close, target: self, action: #selector(ViewController.onClickBackButton(sender:)))
        backButton.tag = 1
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setRightBarButton(backButton, animated: true)
        self.navigationItem.title = "シェア履歴"
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shareInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        cell.tag = indexPath.row + 1
        cell.setCell(number:"\(cell.tag)", time: shareInfo[indexPath.row].shareTime, user: shareInfo[indexPath.row].shareUser)
        return cell
    }
    

    
}
