//
//  FontsCollection.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 03/08/23.
//

import Foundation
import UIKit

class FontsCollection{
    
    let primaryFont  :PrimaryFont    = PrimaryFont()
    let secondaryFont: SecondaryFont = SecondaryFont()
    let tropilineFont: TropilineFont = TropilineFont()
    
    // Display
    var displayBold40       : UIFont
    var displayBold32       : UIFont
    //Heading
    var headingBold24       : UIFont
    var headingMedium24     : UIFont
    var headingBold20       : UIFont
    var headingMedium20     : UIFont
    var headingMedium18     : UIFont
    var headingMedium16     : UIFont
    var headingMedium14     : UIFont
    var headingMedium12     : UIFont
    var headingMedium10     : UIFont

    //Subheading
    var subheadingBold20    : UIFont
    var subheadingBold18    : UIFont
    var subheadingBold16    : UIFont
    var subheadingBold14    : UIFont
    var subheadingBold12    : UIFont
    var subheadingBold10    : UIFont
    //Body
    var bodyRegular16       : UIFont
    var bodyRegular14       : UIFont
    var bodyRegular12       : UIFont
    var bodyRegular10       : UIFont
    
    init(){
        displayBold40    = primaryFont.bold.withSize(40 * 0.75)
        displayBold32    = primaryFont.bold.withSize(32)
        
        headingBold24    = primaryFont.bold.withSize(24 * 0.75)
        headingBold20    = primaryFont.bold.withSize(20 * 0.75)
        headingMedium24  = primaryFont.medium.withSize(24 * 0.75)
        headingMedium20  = primaryFont.medium.withSize(20 * 0.75)
        headingMedium18  = primaryFont.medium.withSize(18 * 0.75)
        headingMedium16  = primaryFont.medium.withSize(16 * 0.75)
        headingMedium14  = primaryFont.medium.withSize(14 * 0.75)
        headingMedium12  = primaryFont.medium.withSize(12 * 0.75)
        headingMedium10  = primaryFont.medium.withSize(10 * 0.75)

        subheadingBold20 = secondaryFont.bold.withSize(20)
        subheadingBold18 = secondaryFont.bold.withSize(18)
        subheadingBold16 = secondaryFont.bold.withSize(16)
        subheadingBold14 = secondaryFont.bold.withSize(14)
        subheadingBold12 = secondaryFont.bold.withSize(12)
        subheadingBold10 = secondaryFont.bold.withSize(10)
        
        bodyRegular16    = secondaryFont.regular.withSize(16)
        bodyRegular14    = secondaryFont.regular.withSize(14)
        bodyRegular12    = secondaryFont.regular.withSize(12)
        bodyRegular10    = secondaryFont.regular.withSize(10)
    }
}

class PrimaryFont{
    
    let systemFont = UIFont.systemFont(ofSize: 16)
    
    var bold   : UIFont
    var medium : UIFont
    var regular: UIFont
    
    init(){
        if((UIFont(name: ThemeConstants.primaryBold   , size: 16)) != nil){
            bold    = UIFont(name: ThemeConstants.primaryBold   , size: 16)!
        }else{
            bold = systemFont
        }
        
        medium  = UIFont(name: ThemeConstants.primaryMedium , size: 16) ?? systemFont
        regular = UIFont(name: ThemeConstants.primaryRegular, size: 16) ?? systemFont
    }
}

class SecondaryFont{
    
    let systemFont = UIFont.systemFont(ofSize: 16)
    
    var bold   : UIFont
    var medium : UIFont
    var regular: UIFont
    
    init(){
        bold    = UIFont(name: ThemeConstants.secondaryBold   , size: 16) ?? systemFont
        medium  = UIFont(name: ThemeConstants.secondaryMedium , size: 16) ?? systemFont
        regular = UIFont(name: ThemeConstants.secondaryRegular, size: 16) ?? systemFont
    }
}

class TropilineFont{
    
    let systemFont = UIFont.systemFont(ofSize: 16)
    
    var bold   : UIFont
    var regular: UIFont
    
    init(){
        bold    = UIFont(name: ThemeConstants.tropilineBold   , size: 16) ?? systemFont
        regular = UIFont(name: ThemeConstants.tropilineRegular, size: 16) ?? systemFont
    }
    
}

