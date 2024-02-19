//
//  ConfigHelper.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 18/08/23.
//

import Foundation

class ConfigHelper{
    
    static let sharedInstance = ConfigHelper()
    
    private let configFileURL = Bundle.main.url(forResource: "Config", withExtension: "plist")
    
    private var configData: Data!
    
    var config:[String: Any]!
    
    private init(){
        configData = try? Data(contentsOf: configFileURL!)
        config = try? PropertyListSerialization.propertyList(from: configData!, options: [], format: nil) as? [String: Any]
    }
    
}
