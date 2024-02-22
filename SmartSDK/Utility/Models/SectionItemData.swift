//
//  SectionItemData.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 12/09/23.
//

import Foundation

class SectionItemData{
    private var _title      : String = ""
    private var _imagePath  : String = ""
    private var _tag        : profileSectionItemEnum!
    
    var title       : String   { get { return _title }      set { _title     = newValue}}
    var imagePath   : String   { get { return _imagePath }  set { _imagePath = newValue}}
    var tag         : profileSectionItemEnum   { get { return _tag }        set { _tag       = newValue}}
    
    // MARK: - Lifecycle
    
    init(){
        
    }
    
    convenience init(titleString:String,imagePathValue:String,tagString:profileSectionItemEnum){
        self.init()
        
        self.title     = titleString
        self.imagePath = imagePathValue
        self.tag       = tagString
    }
}
