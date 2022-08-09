//
//  CustomTableViewCell.swift
//  shareOfModel
//
//  Created by 小室沙央里 on 2022/08/02.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let numberLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let userLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier )
        addSubview(numberLabel)
        addSubview(timeLabel)
        addSubview(userLabel)
        
        numberLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.width.equalToSuperview().multipliedBy(0.1).priority(.high)
            make.height.equalTo(50)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(numberLabel.snp.right).offset(5)
            make.width.equalToSuperview().multipliedBy(0.3).priority(.high)
            make.height.equalTo(50)
        }
        
        userLabel.snp.makeConstraints { make in
            make.left.equalTo(timeLabel.snp.right)
            make.width.equalToSuperview().multipliedBy(0.6).priority(.high)
            make.height.equalTo(50)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(number:String, time: String, user: String) {
        numberLabel.text = number
        timeLabel.text = time
        userLabel.text = user
    }
}
