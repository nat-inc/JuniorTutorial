//
//  CustomUICollectionViewCell_2.swift
//  Learning-FaboSwiftDocs9
//
//  Created by 小室沙央里 on 2022/09/09.
//

import UIKit

class CustomUICollectionViewCell_2: UICollectionViewCell {
    
    var textLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height: frame.height))
        textLabel?.text = "nil"
        textLabel?.textAlignment = NSTextAlignment.center
        
        self.contentView.addSubview(textLabel!)
        
    }
}
