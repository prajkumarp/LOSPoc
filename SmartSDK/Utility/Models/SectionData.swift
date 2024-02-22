//
//  SectionData.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 12/09/23.
//

import Foundation

class SectionData{
    
    private var _header :String = ""
    private var _sectionItems:[SectionItemData] = []
    
    var header : String { get { return _header } set { _header = newValue}}
    var sectionItems : [SectionItemData] { get { return _sectionItems } set { _sectionItems = newValue}}
    
    
    // MARK: - Lifecycle
    
    init(){
        
    }
    
    convenience init(headerString:String,sectionItemsArray:[SectionItemData]){
        self.init()
        
        self.header = headerString
        self.sectionItems = sectionItemsArray
    }
}
