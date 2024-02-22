//
//  LaunchPageScreenObject.swift
//  SmartSDK
//
//  Created by Rajkumar on 22/02/24.
//

import Foundation

class LaunchPageScreenObject{
    
    var launchPageControls : [ctaControl] = []

    init(launchLayoutConfigData:LaunchLayoutConfigData){
        for index in 0..<launchLayoutConfigData.buttons.count{
            let buttonValue = launchLayoutConfigData.buttons[index]
            let ctaControl  = ctaControl(button: buttonValue)
            ctaControl.index = index
            launchPageControls.append(ctaControl)
        }
    }
}

class ctaControl {
    
    var displaytext : String = ""
    var renderMode  : renderModeEnum = .web
    var windowType  : windowTypeEnum = .fullScreen
    var url         : String = ""
    var header      : pageHeader
    var index       : Int = 0
    
    init (button : Button){
        self.displaytext    = button.text
        self.renderMode     = renderModeEnum(rawValue: button.renderMode) ?? .web
        self.windowType     = windowTypeEnum(rawValue: button.windowType) ?? .fullScreen
        self.url            = button.url
        self.header         = pageHeader(headerValue: button.header)
    }
}

class pageHeader {
    var isVisible   : Bool = true
    var showBack    : Bool = true
    var showClose   : Bool = true

    
    init(headerValue : Header){
        self.isVisible = headerValue.isVisible
        self.showBack  = headerValue.showBack
        self.showClose = headerValue.showClose
 
    }
}
