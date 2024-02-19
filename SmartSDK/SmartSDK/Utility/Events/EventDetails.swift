//
//  EventDetails.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 10/07/23.
//

import Foundation

class EventDetails {
    
    private var _name       : String        = ""
    private var _uniqueID   : String        = ""
    private var _type       : EventTypes    = EventTypes.log
    private var _payload    : Dictionary    = Dictionary<String,String>()
        
    
    var name    : String    { get { return _name }      set { _name     = newValue } }
    var uniqueID: String    { get { return _uniqueID }  set { _uniqueID = newValue } }
    var type    : EventTypes{ get { return _type }      set { _type     = newValue } }
    
    var payload : Dictionary<String,String> { get { return _payload } set { _payload = newValue } }
    
}
