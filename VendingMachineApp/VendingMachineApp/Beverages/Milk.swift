//
//  Milk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    override init(_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ date: Date) {
        super.init(brand, volume, price, name, date)
        self.kind = "우유"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func checkFarmCode() -> String {
        return "headquarter"
    }

}