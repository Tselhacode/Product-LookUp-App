//
//  SaveTableViewCell.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 11/1/21.
//

import UIKit

class SaveTableViewCell: UITableViewCell {
    static var shared = SaveTableViewCell()
    @IBOutlet weak var SaveItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
