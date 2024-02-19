//
//  Logger.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 18/07/23.
//

import Foundation

struct Logger{
    
    func log(eventDetails : EventDetails){
        
//#if DEBUG
        print(convertDetailsToString(eventDetails: eventDetails))
//#endif
        
    }
    
    
    private func convertDetailsToString(eventDetails:EventDetails) -> String{
        
        var returnString = ""
        
        returnString = returnString + "Type : " + eventDetails.type.name + " , "
        
        returnString = returnString + "Name : " + eventDetails.name + " , "
        
        returnString = returnString + "Unique ID : " + eventDetails.uniqueID + " , "
        
        returnString = returnString + "Payload : " + eventDetails.payload.description
        
        return returnString
    }
}
