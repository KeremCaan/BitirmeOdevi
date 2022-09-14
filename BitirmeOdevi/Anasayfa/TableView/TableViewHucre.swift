//
//  TableViewHucre.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 4.09.2022.
//

import UIKit

class TableViewHucre: UITableViewCell {
    @IBOutlet weak var ivYemekler: UIImageView!
    @IBOutlet weak var lblYemekler: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
