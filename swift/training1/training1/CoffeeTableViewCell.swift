//
//  CoffeeTableViewCell.swift
//  training1
//
//  Created by 小室沙央里 on 2022/07/12.


import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:13)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton:UIButton = {
       let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 10.0
        button.setTitle("削除", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
//        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50) //要らないのかも？
        button.translatesAutoresizingMaskIntoConstraints = false

       return button
    }()
    
    let changeButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 10.0
        button.setTitle("変更", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
//        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50) //
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
        
    }()
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier )
        addSubview(nameLabel)
        addSubview(contentLabel)
        contentView.addSubview(deleteButton) //修正箇所
        contentView.addSubview(changeButton)
        
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant:140).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/5).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-100).isActive = true

        contentLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140).isActive = true
        contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/5).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-30).isActive = true

        deleteButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/7).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-60).isActive = true

        changeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 200).isActive = true
        changeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/7).isActive = true
        changeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-60).isActive = true
    }

    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(name: String, content: String){
        nameLabel.text = name
        contentLabel.text = content
    }
}




//class CoffeeTableViewCell: UITableViewCell {
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//    required init?(coder:NSCoder){
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func layoutSubviews() {
//        contentView.backgroundColor = .clear
//        backgroundColor = .clear
//    }
//
//    private let backView = UIView()
//    private func setupUIView() {
//        backView.backgroundColor = UIColor.gray
//        backView.layer.cornerRadius = 5
//        addSubview(backView)
//        backView.snp.makeConstraints {
//
//        }
//
//    }
//
//    let priceLabel = UILabel()
//    private func setupcellLabel(){
//        priceLabel.font = UIFont.systemFont(ofSize: 20)
//
//    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

//}
