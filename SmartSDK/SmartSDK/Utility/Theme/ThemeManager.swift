//
//  ThemeManager.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 24/07/23.
//

import Foundation

class ThemeManager{
    
    static let sharedInstance = ThemeManager()
    
    var primaryTheme : Theme = Theme()
    
    private init(){
        primaryTheme = Theme(themeData: self.getThemeData()!)
    }
    
    
    private func getThemeData() -> ThemeData?{
        
        let fileURL = Bundle.main.url(forResource: "ThemeData", withExtension: "json")

        do {
            let jsonData = try Data(contentsOf: fileURL!)
            let decoder = JSONDecoder()
            let themeData = try? decoder.decode(ThemeData.self, from: jsonData)
            EventManager().log(log: themeData.debugDescription)
            return themeData
        } catch {
            // Handle the error if the JSON data cannot be parsed
            print("Error: \(error)")
            return nil
        }
        
    }
    
}
