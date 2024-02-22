//
//  SmartFramework.swift
//  SmartSDK
//
//  Created by Rajkumar.Panneerselvam on 12/02/24.
//

import Foundation
import UIKit

public struct SmartFramework{
    
    private var configString : String = ""
    
    public init(jsonString config: String){
        configString = config
    }
    
    public func getLandingPage()->UIViewController{
        return LandingPageViewController()
    }
    
}
