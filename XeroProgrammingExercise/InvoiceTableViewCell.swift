//
//  InvoiceTableViewCell.swift
//  XeroProgrammingExercise
//
//  Created by Shireesh Marla on 22/11/2021.
//  Copyright © 2021 Xero Ltd. All rights reserved.
//

import UIKit

class InvoiceTableViewCell: UITableViewCell {
    
    @IBOutlet var invoiceId: UILabel!
    @IBOutlet var invoiceDate: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
