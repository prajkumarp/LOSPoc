//
//  SmartFramework.swift
//  SmartSDK
//
//  Created by Rajkumar.Panneerselvam on 12/02/24.
//

import Foundation
import UIKit

public struct SmartFramework{
    
    public static let sharedInstance = SmartFramework()
    private var launchConfig : LaunchPageScreenObject?
    private var configString : String = ""
    private var primaryTheme : Theme = Theme()
    
    private init(){
        primaryTheme = ThemeManager.sharedInstance.primaryTheme
        print(primaryTheme.palette.baseColor.base1)
    }
    
    public mutating func setLaunchConfig(filename : String){
        let ch = ConfigHelper.sharedInstance
        let layoutConfigDetails = ch.getLayoutConfig(filename: filename)
        launchConfig = LaunchPageScreenObject(launchLayoutConfigData: layoutConfigDetails!)
    }
    
    public func getLandingPage()->UIViewController{
        return LandingPageViewController(for: launchConfig!)
    }
    
}
