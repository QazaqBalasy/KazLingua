//
//  TextCollectionViewCell.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/25/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        contentView.layer.masksToBounds = true
        layer.masksToBounds = false
        
//        print(containerView.frame.size.height / 5)
//        containerView.layer.cornerRadius = 10.0
//            layer.shadowColor = UIColor.black.cgColor
//            layer.shadowOffset = CGSize(width: 0, height: 1.0)
//            layer.shadowRadius = 2.0
//            layer.shadowOpacity = 0.5
            
            //layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
//        layer.cornerRadius = radius
        // Initialization code
    }
    

}
