//
//  EventManager.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 10/07/23.
//

import Foundation



struct EventManager {
    
    func sendEventDetails(eventDetails : EventDetails){
        
        switch(eventDetails.type){
            
        case .navigation,.cta,.alert,.log:
            sendtoLogger(eventDetails: eventDetails)
            sendToAnalytics(eventDetails: eventDetails)
            
        case .apiRequest,.apiResponse,.error,.exception:
            sendtoLogger(eventDetails: eventDetails)
    
        }
    }
    
    func log(log: String){
        
        let eventDetails = EventDetails()
        
        eventDetails.name = ""
        eventDetails.type = .log
        eventDetails.uniqueID = ""
        eventDetails.payload = ["Log":log]
        
        sendtoLogger(eventDetails: eventDetails)
    }
    
    func logError(error:Error!){
        
        let eventDetails = EventDetails()
        
        eventDetails.name = ""
        eventDetails.type = .error
        eventDetails.uniqueID = ""
        var errorDescription = "No error available."
        
        if (error != nil){
            errorDescription = error.localizedDescription
        }
        eventDetails.payload = ["Log":errorDescription]
        
        sendtoLogger(eventDetails: eventDetails)
        
    }
    
    private func sendtoLogger(eventDetails : EventDetails){
        Logger().log(eventDetails: eventDetails)
    }
    
    private func sendToAnalytics(eventDetails : EventDetails){
        MixPanelHelper.sharedInstance.sendEvent(eventDetails: eventDetails)
    }
    
}
