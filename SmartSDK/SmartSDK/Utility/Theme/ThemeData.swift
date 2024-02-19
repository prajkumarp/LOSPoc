//
//  PaletteData.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 24/07/23.
//

import Foundation




import Foundation

// MARK: - ThemeData
class ThemeData: Codable {
    var palette: Palette?

    init(palette: Palette?) {
        self.palette = palette
    }
}

// MARK: - Palette
class Palette: Codable {
    var base: Base?
    var gray: Gray?
    var status: Status?
    var secondarydark, secondarymedium, secondarylight, secondarylesssaturatedlight, secondarylesssaturateddark: Secondary?

    init(base: Base?, gray: Gray?, status: Status?, secondarydark: Secondary?, secondarymedium: Secondary?, secondarylight: Secondary?, secondarylesssaturatedlight: Secondary?, secondarylesssaturateddark: Secondary?) {
        
        self.base   = base
        self.gray   = gray
        self.status = status
        
        self.secondarydark      = secondarydark
        self.secondarymedium    = secondarymedium
        self.secondarylight     = secondarylight
        
        self.secondarylesssaturatedlight   = secondarylesssaturatedlight
        self.secondarylesssaturateddark    = secondarylesssaturateddark
    }
}

// MARK: - Base
class Base: Codable {
    var base1, base2, base3: String?

    init(base1: String?, base2: String?, base3: String?) {
        self.base1 = base1
        self.base2 = base2
        self.base3 = base3
    }
}

// MARK: - Gray
class Gray: Codable {
    var gray1000, gray600, gray300, gray100: String?
    var gray90,gray80, gray70, gray60, gray50, gray40: String?
    var gray30, gray20, gray10,gray0: String?

    init(gray1000: String?, gray600: String?, gray300: String?, gray100: String?,gray90:String?,gray80:String?, gray70: String?, gray60: String?, gray50: String?, gray40: String?, gray30: String?, gray20: String?,gray10: String?, gray0: String?) {
        self.gray1000   = gray1000
        self.gray600    = gray600
        self.gray300    = gray300
        self.gray100    = gray100
        self.gray90     = gray90
        self.gray80     = gray80
        self.gray70     = gray70
        self.gray60     = gray60
        self.gray50     = gray50
        self.gray40     = gray40
        self.gray30     = gray30
        self.gray20     = gray20
        self.gray10     = gray10
        self.gray0      = gray0
    }
}

// MARK: - Scecondary
class Secondary: Codable {
    var yellow, orange, red, pink, purple, blue, green: String?

    init(yellow: String?, orange: String?, red: String?, pink: String?, purple: String?, blue: String?, green: String?) {
        self.yellow = yellow
        self.orange = orange
        self.red    = red
        self.pink   = pink
        self.purple = purple
        self.blue   = blue
        self.green  = green
    }
}

// MARK: - Status
class Status: Codable {
    var success, error, severewarning, warning, information: String?

    init(success: String?, error: String?, severewarning: String?, warning: String?, information: String?) {
        self.success        = success
        self.error          = error
        self.severewarning  = severewarning
        self.warning        = warning
        self.information    = information
    }
}
