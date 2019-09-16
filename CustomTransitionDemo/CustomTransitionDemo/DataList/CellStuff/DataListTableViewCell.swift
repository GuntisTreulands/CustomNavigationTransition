//
//  DataListTableViewCell.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class DataListTableViewCell: UITableViewCell {

	@IBOutlet var dataCellView: DataCellView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
