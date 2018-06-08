//
//  UserTableViewCell.swift
//  iOSMVVM
//
//  Created by Raja Jawahar on 08/06/18.
//  Copyright © 2018 Raja Jawahar. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
