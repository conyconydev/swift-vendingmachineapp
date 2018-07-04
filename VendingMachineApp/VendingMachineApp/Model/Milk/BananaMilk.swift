//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var flavor: String
    
    override init(name: String, price: Int, farmCode: Int) {
        self.flavor = "바나나맛"
        super.init(name: name, price: price, farmCode: farmCode)
    }
    
    convenience init() {
        self.init(name: DefaultData.bananaMilk.name, price: DefaultData.bananaMilk.price, farmCode: 102)
    }
    
    private struct NSCoderKeys {
        static let flavorKey = "flavor"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(flavor as String, forKey: NSCoderKeys.flavorKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let flavor = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.flavorKey) else {
            return nil
        }
        self.flavor = flavor as String
        super.init(coder: aDecoder)
    }
}
