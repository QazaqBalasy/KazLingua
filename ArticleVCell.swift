//
//  ArticleVCell.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/13/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class ArticleVCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    var labelTxt = ""
    var img = ""
    override func awakeFromNib() {
        super.awakeFromNib()
//        label.text = labelTxt
//        imageV.image = UIImage.init(systemName: img)
        // Initialization code
    }
    

}
