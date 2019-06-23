//
//  Soda.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {

    private let suger: Bool
    private let expiredays: Int = 365

    init(brand: String,
         volume: Int,
         price: Int,
         name: String,
         manufacturedDate: Date,
         suger: Bool ,
         expiryPeriod: ExpirationPeriod = ExpirationPeriod(endDay: 365)) {
        self.suger = true
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate,
            expiryPeriod: expiryPeriod )
    }

    // Required Initializers
    required convenience init() {
        self.init(
            brand: "",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            suger: true,
            expiryPeriod: ExpirationPeriod(endDay: 0)
        )
    }

    // 무가당 여부
    func isSuger() -> Bool {
        if suger == true { return true }
        return false
    }
    
    // MARK: - NSSecureCoding
    enum SodaCodingKeys : String, CodingKey{
        case suger
    }
    
    required init?(coder aDecoder: NSCoder) {
        suger = aDecoder.decodeBool(forKey: SodaCodingKeys.suger.rawValue)
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(suger, forKey: SodaCodingKeys.suger.rawValue)
    }
    
}
