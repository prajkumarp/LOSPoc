//
//  Constants.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 06/07/23.
//

import Foundation

struct Constants{
    
    // MARK: - Default
    static let defaultPlaceholderImageName : String = "warning.svg"
    
    // MARK: - Fontnames
    // MARK: Primary fonts
    static let primaryBold : String         = "Geomanist-Bold"
    static let primaryMedium : String       = "Geomanist-Medium"
    static let primaryRegular: String       = "Geomanist-Regular"
    // MARK: Secondary fonts
    static let secondaryBold: String        = "Inter-SemiBold"
    static let secondaryMedium: String      = "Inter-Medium"
    static let secondaryRegular : String    = "Inter-Regular"
    // MARK: Tropiline
    static let tropilineBold : String = "Tropiline-Bold"
    static let tropilineRegular : String = "Tropiline-Regular"
    
    // MARK: - Tab Names
    
    static let home     : String = NSLocalizedString("home_tab", comment: "home_tab")
    static let purchases: String = NSLocalizedString("purchases_tab", comment: "purchases_tab")
    static let cash     : String = NSLocalizedString("cash_tab", comment: "cash_tab")
    static let shop     : String = NSLocalizedString("shop_tab", comment: "shop_tab")
    static let profile  : String = NSLocalizedString("profile_tab", comment: "profile_tab")
    
    // MARK: - Image names
    
    // MARK: Image file name for tab
    
    static let tabImageHeight   : Int    = 22
    static let tabImageWidth    : Int    = 22
    static let homeTabImage     : String = "home_white"
//    static let homeTabImage  : String = "profile_white"
    static let purchasesTabImage: String = "purchases_white"
    static let cashTabImage     : String = "cash"
    static let shopTabImage     : String = "shop_white"
    static let profileTabImage  : String = "profile"
    
    // MARK: Image file name for Profile section
    
    //Account section
    static let personalDetailsImage :String = "id"
    static let employmentDetailsImage : String = "details"
    static let bankandAutoPayImage : String = "rupee"
    
    // Support section
    static let frequentlyAskedQuestionsImage: String = "help"
    static let chatImage : String = ""
    static let callUsImage : String = "phone"
    static let sendusAnEmailImage : String = "email"
    
    //ZestMoney Section
    static let aboutusImage : String = "ZestMoney-circle"
    static let privacyPolicyImage : String = "info"
    static let termsofServiceImage : String = "terms"
    static let rateusImage : String = "star"
    
    // MARK: - Event names
    
    static let appLaunchEvent   : String = "app_launch"
    
    // MARK: App Launch events
    
 
}
