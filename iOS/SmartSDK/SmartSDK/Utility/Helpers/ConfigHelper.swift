//
//  ConfigHelper.swift
//  SmartShell
//
//  Created by Rajkumar.Panneerselvam on 21/02/24.
//

import Foundation

import Foundation

public class ConfigHelper{
    
    public static let sharedInstance = ConfigHelper()
    
    private let configFileURL = Bundle.main.url(forResource: "Config", withExtension: "plist")
    
    private var configData: Data!
    
    var config:[String: Any]!
    
    private init(){
        configData = try? Data(contentsOf: configFileURL!)
        config = try? PropertyListSerialization.propertyList(from: configData!, options: [], format: nil) as? [String: Any]
    }
    
    public func getLayoutConfig(filename : String) -> LaunchLayoutConfigData? {
        
        let fileURL = Bundle.main.url(forResource: filename, withExtension: "json")

        do {
            let jsonData = try Data(contentsOf: fileURL!)
            let decoder = JSONDecoder()
            let themeData = try? decoder.decode(LaunchLayoutConfigData.self, from: jsonData)
            return themeData
        } catch {
            // Handle the error if the JSON data cannot be parsed
            print("Error: \(error)")
            return nil
        }
        
    }
    
}
