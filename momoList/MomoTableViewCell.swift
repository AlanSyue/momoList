//
//  MomoTableViewCell.swift
//  momoList
//
//  Created by 林翊婷 on 2022/2/2.
//

import UIKit

class MomoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
