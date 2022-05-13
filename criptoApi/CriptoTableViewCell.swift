//
//  CriptoTableViewCell.swift
//  criptoApi
//
//  Created by jay vachhani on 10/05/22.
//

import UIKit

class CriptoTableViewCell: UITableViewCell {
    @IBOutlet weak var criptoNameLabel: UILabel!
    @IBOutlet weak var lowPriceLabel: UILabel!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
