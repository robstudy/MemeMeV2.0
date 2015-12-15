//
//  MemeTVCell.swift
//  MemeMeV2.0
//
//  Created by Robert Garza on 12/3/15.
//  Copyright © 2015 Robert Garza. All rights reserved.
//

import UIKit

class MemeTVCell: UITableViewCell {

    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memeText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        memeText.editable = false
        memeText.selectable = false
    }
}
