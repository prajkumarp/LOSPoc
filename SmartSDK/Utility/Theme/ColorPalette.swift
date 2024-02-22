//
//  Palette.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 24/07/23.
//

import Foundation
import UIKit

class ColorPalette{

    // Primary
    var baseColor   : BaseColors   = BaseColors()
    var grayColors  : GrayColors   = GrayColors()
    var statusColors: StatusColors = StatusColors()
    
    // Secondary
    var secondaryDarkColors     : SecondaryDarkColors  = SecondaryDarkColors()
    var secondaryMediumColors   : SecondaryMediumColors = SecondaryMediumColors()
    var secondaryLightColors    : SecondaryLightColors  = SecondaryLightColors()
    
    //Secondary extended
    var secondaryLessSaturatedLightColors: SecondaryLessSaturatedLightColors = SecondaryLessSaturatedLightColors()
    var secondaryLessSaturatedDarkColors : SecondaryLessSaturatedDarkColors  = SecondaryLessSaturatedDarkColors()
    
    init(){
        
    }
    
    init(themeData : ThemeData){
            baseColor    = BaseColors(themeData: themeData)
            grayColors   = GrayColors(themeData: themeData)
            statusColors = StatusColors(themeData: themeData)
            
            secondaryDarkColors     = SecondaryDarkColors(themeData: themeData)
            secondaryMediumColors   = SecondaryMediumColors(themeData: themeData)
            secondaryLightColors    = SecondaryLightColors(themeData: themeData)
            
            secondaryLessSaturatedLightColors = SecondaryLessSaturatedLightColors(themeData: themeData)
            secondaryLessSaturatedDarkColors  = SecondaryLessSaturatedDarkColors(themeData: themeData)
    }
}

// MARK: Base colors
class BaseColors{
    
    var base1 : UIColor
    var base2 : UIColor
    var base3 : UIColor
    
    init(){
        base1 = UIColor(hex: "#000000")!
        base2 = UIColor(hex: "#FFFFFF")!
        base3 = UIColor(hex: "#2BB25D")!
    }
    
    init(themeData:ThemeData){
        base1 = UIColor(hex: (themeData.palette?.base?.base1)!)!
        base2 = UIColor(hex: (themeData.palette?.base?.base2)!)!
        base3 = UIColor(hex: (themeData.palette?.base?.base3)!)!
    }
    

}

// MARK: Gray colors
class GrayColors{
    var gray1000 : UIColor
    var gray600  : UIColor
    var gray300  : UIColor
    var gray100  : UIColor
    var gray90   : UIColor
    var gray80   : UIColor
    var gray70   : UIColor
    var gray60   : UIColor
    var gray50   : UIColor
    var gray40   : UIColor
    var gray30   : UIColor
    var gray20   : UIColor
    var gray10   : UIColor
    var gray0    : UIColor
    
    init(){
         gray1000 = UIColor(hex: "#000000")!
         gray600  = UIColor(hex: "#2E2E2E")!
         gray300  = UIColor(hex: "#575757")!
         gray100  = UIColor(hex: "#757575")!
         gray90   = UIColor(hex: "#1A1A1A")!
         gray80   = UIColor(hex: "#4A4A4A")!
         gray70   = UIColor(hex: "#737373")!
         gray60   = UIColor(hex: "#B0B0B0")!
         gray50   = UIColor(hex: "#BFBFBF")!
         gray40   = UIColor(hex: "#DEDEDE")!
         gray30   = UIColor(hex: "#EBEBEB")!
         gray20   = UIColor(hex: "#F5F5F5")!
         gray10   = UIColor(hex: "#F0F0F0")!
         gray0    = UIColor(hex: "#FFFFFF")!
    }
    
    init(themeData:ThemeData){
        gray0    = UIColor(hex: (themeData.palette?.gray?.gray0)!)!
        gray10   = UIColor(hex: (themeData.palette?.gray?.gray10)!)!
        gray20   = UIColor(hex: (themeData.palette?.gray?.gray20)!)!
        gray30   = UIColor(hex: (themeData.palette?.gray?.gray30)!)!
        gray40   = UIColor(hex: (themeData.palette?.gray?.gray40)!)!
        gray50   = UIColor(hex: (themeData.palette?.gray?.gray50)!)!
        gray60   = UIColor(hex: (themeData.palette?.gray?.gray60)!)!
        gray70   = UIColor(hex: (themeData.palette?.gray?.gray70)!)!
        gray80   = UIColor(hex: (themeData.palette?.gray?.gray80)!)!
        gray90   = UIColor(hex: (themeData.palette?.gray?.gray90)!)!
        gray100  = UIColor(hex: (themeData.palette?.gray?.gray100)!)!
        gray300  = UIColor(hex: (themeData.palette?.gray?.gray300)!)!
        gray600  = UIColor(hex: (themeData.palette?.gray?.gray600)!)!
        gray1000 = UIColor(hex: (themeData.palette?.gray?.gray1000)!)!
    }
}

// MARK: Status
class StatusColors{
    var success       : UIColor
    var error         : UIColor
    var severewarning : UIColor
    var warning       : UIColor
    var information   : UIColor
    
    init(){
         success         = UIColor(hex: "#2BB25D")!
         error           = UIColor(hex: "#F0323C")!
         severewarning   = UIColor(hex: "#EC6D00")!
         warning         = UIColor(hex: "#FFB717")!
         information     = UIColor(hex: "#0566EC")!
    }
    
    init(themeData:ThemeData){
        success         = UIColor(hex: (themeData.palette?.status?.success)!)!
        error           = UIColor(hex: (themeData.palette?.status?.error)!)!
        severewarning   = UIColor(hex: (themeData.palette?.status?.severewarning)!)!
        warning         = UIColor(hex: (themeData.palette?.status?.warning)!)!
        information     = UIColor(hex: (themeData.palette?.status?.information)!)!
    }
}

// MARK: Secondary Dark
class SecondaryDarkColors{
    var yellow : UIColor
    var orange : UIColor
    var red    : UIColor
    var pink   : UIColor
    var purple : UIColor
    var blue   : UIColor
    var green  : UIColor
    
    init(){
         yellow = UIColor(hex: "#FFBA08")!
         orange = UIColor(hex: "#F36F30")!
         red    = UIColor(hex: "#CA4446")!
         pink   = UIColor(hex: "#C94494")!
         purple = UIColor(hex: "#7F44C9")!
         blue   = UIColor(hex: "#1863C9")!
         green  = UIColor(hex: "#31916F")!
        
    }
    
    init(themeData:ThemeData){
        yellow  = UIColor(hex: (themeData.palette?.secondarydark?.yellow)!)!
        orange  = UIColor(hex: (themeData.palette?.secondarydark?.orange)!)!
        red     = UIColor(hex: (themeData.palette?.secondarydark?.red)!)!
        pink    = UIColor(hex: (themeData.palette?.secondarydark?.pink)!)!
        purple  = UIColor(hex: (themeData.palette?.secondarydark?.purple)!)!
        blue    = UIColor(hex: (themeData.palette?.secondarydark?.blue)!)!
        green   = UIColor(hex: (themeData.palette?.secondarydark?.green)!)!
    }
}

// MARK: Secondary Medium
class SecondaryMediumColors{
    var yellow : UIColor
    var orange : UIColor
    var red    : UIColor
    var pink   : UIColor
    var purple : UIColor
    var blue   : UIColor
    var green  : UIColor
    
    init(){
         yellow = UIColor(hex: "#FECA3C")!
         orange = UIColor(hex: "#FF9052")!
         red    = UIColor(hex: "#FD686A")!
         pink   = UIColor(hex: "#F770C1")!
         purple = UIColor(hex: "#976FF6")!
         blue   = UIColor(hex: "#398BFD")!
         green  = UIColor(hex: "#00B070")!
    }
    
    init(themeData:ThemeData){
        yellow  = UIColor(hex: (themeData.palette?.secondarymedium?.yellow)!)!
        orange  = UIColor(hex: (themeData.palette?.secondarymedium?.orange)!)!
        red     = UIColor(hex: (themeData.palette?.secondarymedium?.red)!)!
        pink    = UIColor(hex: (themeData.palette?.secondarymedium?.pink)!)!
        purple  = UIColor(hex: (themeData.palette?.secondarymedium?.purple)!)!
        blue    = UIColor(hex: (themeData.palette?.secondarymedium?.blue)!)!
        green   = UIColor(hex: (themeData.palette?.secondarymedium?.green)!)!
    }
}

// MARK: Secondary Light
class SecondaryLightColors{
    var yellow          = UIColor(hex: "#FEDF81")
    var orange          = UIColor(hex: "#FECCAD")
    var red             = UIColor(hex: "#FEAFAE")
    var pink            = UIColor(hex: "#F8A4D5")
    var purple          = UIColor(hex: "#DCAAF7")
    var blue            = UIColor(hex: "#A6C4F9")
    var green           = UIColor(hex: "#A8DFBD")
    
    init(){
        
    }
    
    init(themeData:ThemeData){
        yellow  = UIColor(hex: (themeData.palette?.secondarylight?.yellow)!)
        orange  = UIColor(hex: (themeData.palette?.secondarylight?.orange)!)
        red     = UIColor(hex: (themeData.palette?.secondarylight?.red)!)
        pink    = UIColor(hex: (themeData.palette?.secondarylight?.pink)!)
        purple  = UIColor(hex: (themeData.palette?.secondarylight?.purple)!)
        blue    = UIColor(hex: (themeData.palette?.secondarylight?.blue)!)
        green   = UIColor(hex: (themeData.palette?.secondarylight?.green)!)
    }
}

// MARK: Secondary Less Saturated Light
class SecondaryLessSaturatedLightColors{
    var yellow          = UIColor(hex: "#F4BC41")
    var orange          = UIColor(hex: "#D88862")
    var red             = UIColor(hex: "#CA595B")
    var pink            = UIColor(hex: "#AB637D")
    var purple          = UIColor(hex: "#AC7AC6")
    var blue            = UIColor(hex: "#7091CF")
    var green           = UIColor(hex: "#63AB7E")
    
    init(){
        
    }
    
    init(themeData:ThemeData){
        yellow  = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.yellow)!)
        orange  = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.orange)!)
        red     = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.red)!)
        pink    = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.pink)!)
        purple  = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.purple)!)
        blue    = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.blue)!)
        green   = UIColor(hex: (themeData.palette?.secondarylesssaturatedlight?.green)!)
    }
}

// MARK: Secondary Less Saturated Dark
class SecondaryLessSaturatedDarkColors{
    var yellow          = UIColor(hex: "#805802")
    var orange          = UIColor(hex: "#773511")
    var red             = UIColor(hex: "#630A0A")
    var pink            = UIColor(hex: "#782845")
    var purple          = UIColor(hex: "#4A1A45")
    var blue            = UIColor(hex: "#001F49")
    var green           = UIColor(hex: "#003F40")
    
    init(){
        
    }
    
    init(themeData:ThemeData){
        yellow  = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.yellow)!)
        orange  = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.orange)!)
        red     = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.red)!)
        pink    = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.pink)!)
        purple  = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.purple)!)
        blue    = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.blue)!)
        green   = UIColor(hex: (themeData.palette?.secondarylesssaturateddark?.green)!)
    }
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])

            if (hexColor.count == 6){ hexColor = hexColor + "FF"}
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

