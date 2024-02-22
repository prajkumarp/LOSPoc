//
//  Utility.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 06/11/23.
//

import Foundation

struct Utility{
    
    func getCurrencyFormattedString(for currencyValue:NSNumber) -> String{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: currencyValue) ?? "₹ \(currencyValue)"
    }
    
    
}
