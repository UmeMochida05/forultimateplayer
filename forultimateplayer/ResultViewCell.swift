//
//  ResultViewCell.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ResultViewCell: UITableViewCell {
    
    @IBOutlet weak var numberlabel: UILabel!
    @IBOutlet weak var whichlabel: UILabel!
    @IBOutlet weak var assistlabel: UILabel!
    @IBOutlet weak var goallabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var howscorelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
