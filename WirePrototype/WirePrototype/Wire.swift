//
//  Wire.swift
//  WirePrototype
//
//  Created by ayubi on 07/10/15.
//  Copyright © 2015 Athvillar. All rights reserved.
//

import Foundation

class Wire {
    var wireId:Int
    var paymentType:String
    var date:String
    var wireSource:String
    var wireDestination:String
    var currency:String
    var wireAmount:Double
    
    init(wireId:Int,paymentType:String, date:String, wireSource:String, wireDestination:String, currency:String, wireAmount:Double){
        //TODO, check all arguments and make the init failable
        self.wireId = wireId
        self.paymentType = paymentType
        self.date = date
        self.wireSource = wireSource
        self.wireDestination = wireDestination
        self.currency = currency
        self.wireAmount = wireAmount
    }
    
    
    
}