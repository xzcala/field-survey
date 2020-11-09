//
//  FieldObservationTableViewCell.swift
//  Field Survey
//
//  Created by Jon Basa on 5/1/20.
//  Copyright © 2020 Jon Basa. All rights reserved.
//

import UIKit

class FieldObservationTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldObservationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
