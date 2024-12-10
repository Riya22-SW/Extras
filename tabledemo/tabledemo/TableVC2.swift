//
//  TableVC2.swift
//  tabledemo
//
//  Created by admin on 29/11/24.
//

import UIKit

class TableVC2: UITableViewCell {

    @IBOutlet weak var namelable: UILabel!
    @IBOutlet weak var idlable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
