//
//  TaskViewCell.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/21/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {

    @IBOutlet weak var leftIV: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftIV.layer.cornerRadius = leftIV.frame.size.height/5
        leftIV.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
        leftIV.layer.borderWidth = 2
        leftIV.layer.borderColor = UIColor.lightGray.cgColor
        
        rightIV.layer.cornerRadius = rightIV.frame.size.height/7
        rightIV.layer.maskedCorners=[.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
        rightIV.layer.borderWidth = 2
        rightIV.layer.borderColor =  UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setRoundsForLeftImage()  {
        leftIV.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
    }
    
    func setRoundsForRightImage()  {
        rightIV.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
    }
    
}
