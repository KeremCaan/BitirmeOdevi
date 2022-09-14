//
//  TableViewHucre.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 8.09.2022.
//

import UIKit

class SepetTableViewHucre: UITableViewCell {
    @IBOutlet weak var ivSepet: UIImageView!
    @IBOutlet weak var lblSepet: UILabel!
    @IBOutlet weak var lblUrunSayi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
