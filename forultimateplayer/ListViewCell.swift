//
//  ListViewCell.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    var didSelectCellAction: (() -> Void)?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var stylelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
