//
//  GarmentTableViewCell.swift
//  Garments
//
//  Created by Jobins John on 2022-08-24.
//

import UIKit

class GarmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var garmentNameLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
