//
//  PageTableViewCell.swift
//  UI_v1_1
//
//  Created by 小室沙央里 on 2022/09/14.
//

import UIKit
import SnapKit

class PageTableViewCell: UITableViewCell {

    let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myImageView)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(name: String, image: String){
        textLabel?.text = name
        let myImage: UIImage = UIImage(named: "right@3x.png")!
        myImageView.image = myImage
        myImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.height.equalTo(50)
    }
    
}
    
}
