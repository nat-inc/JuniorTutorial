//
//  ViewController.swift
//  UI_v1_1
//
//  Created by 小室沙央里 on 2022/09/14.
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

struct UIIndex {
    var name: String
    var image: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var loginPages: Array<UIIndex> = []
//    private let loginPages: NSArray = ["Login"]
    
    private var launchPages: Array<UIIndex> = []
//    private let launchPages: NSArray = ["Launch1", "Launch2"]
    
    private let sections: NSArray = ["Login", "Launch"]
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let lo1 = UIIndex(name: "Login1", image: "right@3x.png")
        let la1 = UIIndex(name: "Launch1", image: "right@3x.png")
        let la2 = UIIndex(name: "Launch2", image: "right@3x.png")
       
        
        loginPages = [lo1]
        launchPages = [la1, la2]
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        let pageTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        pageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        pageTableView.dataSource = self
        pageTableView.delegate = self
        self.view.addSubview(pageTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value: \(loginPages[indexPath.row])")
        }else if indexPath.section == 1 {
            print("Value: \(launchPages[indexPath.row])")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.tag = indexPath.row
        }else if indexPath.section > 0 {
            cell.tag = indexPath.row + loginPages.count
        }
        
        
        print(cell.tag)
        onClickCell(tag: cell.tag)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return loginPages.count
        } else if section == 1 {
            return launchPages.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(loginPages[indexPath.row].name)"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(launchPages[indexPath.row].name)"
        }
        
        cell.imageView?.image = UIImage(named: "right@3x.png")?.resize(size: CGSize(width: 40, height: 40))
        cell.imageView?.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
       
        
        return cell

    }
    
    @objc func onClickCell(tag: Int) {
        
        let selectedTag = tag
        
        switch selectedTag {
        case 0:
            let nextViewController = Login1_ViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
        case 1:
            let nextViewController = Launch1_ViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
        case 2:
            let nextViewController = Launch2_ViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
        default:
            print("error")
        }
    }
}

