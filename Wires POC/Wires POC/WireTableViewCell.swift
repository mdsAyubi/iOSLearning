//
//  WireTableViewCell.swift
//  Wires POC
//
//  Created by ayubi on 06/10/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class WireTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var paymentTypeLabel: UILabel!

    @IBOutlet weak var wireSourceLabel: UILabel!
    @IBOutlet weak var wireActualSourceNameLabel: UILabel!
    
    
    @IBOutlet weak var wireCurrencyLabel: UILabel!
    
    
    @IBOutlet weak var wireDateLabel: UILabel!
    
    @IBOutlet weak var wireDestinationLabel: UILabel!
    
    @IBOutlet weak var wireActualDestinationLabel: UILabel!
    @IBOutlet weak var wireAmountLabel: UILabel!
    
    
    
}
