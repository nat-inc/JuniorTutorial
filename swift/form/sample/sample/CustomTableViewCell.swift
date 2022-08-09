//
//  CustomTableViewCell.swift
//  sample
//
//  Created by 小室沙央里 on 2022/07/30.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    let nameLabel:UILabel={
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
      label.translatesAutoresizingMaskIntoConstraints=false
      return label
    }()

    let deleteButton:UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("HißA", for: .normal)
      button.frame = CGRect (x: 50, y: 50, width: 50, height: 50)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name:String, content:String) {
      contentLabel.text = content
      nameLabel.text = name
    }

}


