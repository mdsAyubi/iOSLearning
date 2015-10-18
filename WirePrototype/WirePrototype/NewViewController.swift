//
//  NewViewController.swift
//  WirePrototype
//
//  Created by ayubi on 07/10/15.
//  Copyright © 2015 Athvillar. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    
    @IBOutlet weak var productLabel: UILabel!
    var titleStringViaSegue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productLabel.text = self.titleStringViaSegue
    }


}
