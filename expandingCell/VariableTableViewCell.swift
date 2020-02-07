//
//  VariableTableViewCell.swift
//  expandingCell
//
//  Created by Soulchild on 07/02/2020.
//  Copyright © 2020 fluffy. All rights reserved.
//

import UIKit

class VariableTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
