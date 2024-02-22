//
//  MixPanelHelper.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 13/07/23.
//

import Foundation
import Mixpanel

class MixPanelHelper{
    
    static let sharedInstance = MixPanelHelper()
    
    var validEvents = [String:String]()
    
    private init(){
    }
    
    func initialize(){
        let mixpanelToken = ProcessInfo.processInfo.environment["mixpanel"]
        Mixpanel.initialize(token: mixpanelToken!, trackAutomaticEvents: true)
        
//#if DEBUG
        Mixpanel.mainInstance().loggingEnabled = true
//#endif
        
        self.populateEventNames()
        self.setCommonSuperProperties()
    }
    
    func sendEvent(eventDetails : EventDetails){
        if validEvents.keys.contains(eventDetails.name){
            Mixpanel.mainInstance().track(event: eventDetails.name, properties: eventDetails.payload)
        }
    }
    
    func setProfileProperties(profileProperties : Dictionary<String,String>){
        Mixpanel.mainInstance().people.set(properties: profileProperties)
    }
    
    // MARK: - Private helper methods
    
    private func setCommonSuperProperties(){
        
    }
    
    private func populateEventNames(){
        validEvents[Constants.appLaunchEvent] = Constants.appLaunchEvent
    }
    
    
}
