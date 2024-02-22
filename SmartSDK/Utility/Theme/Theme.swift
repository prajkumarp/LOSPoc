//
//  Theme.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 24/07/23.
//

import Foundation
import UIKit

class Theme{
    
    var palette : ColorPalette
    var fonts: FontsCollection
    
    init(){
        palette = ColorPalette()
        fonts   = FontsCollection()
        setColorArrtibutes()
    }
    
    convenience init(themeData : ThemeData ){
        self.init()
        palette = ColorPalette(themeData: themeData)
        setColorArrtibutes()
    }
    
    private func setColorArrtibutes(){
        
        // Generic
        primaryBackground   = palette.baseColor.base2
        secondaryBackground = palette.baseColor.base1
        
        //Bottom Navigation
        navBar_selected      = palette.baseColor.base3
        navBar_unselected    = palette.baseColor.base1
        navBar_Text_Selected = palette.baseColor.base3
        navBar_Text_Normal   = palette.baseColor.base1
        
        // Buttons
        
        primaryButton_Default_White_Diabled = palette.grayColors.gray300
        primaryButton_Default_Black_Normal  = palette.grayColors.gray1000
        primaryButton_Default_Black_Diabled = palette.grayColors.gray60
        
        primaryButton_Default_White_Diabled_Text = palette.grayColors.gray50
        primaryButton_Default_Black_Normal_Text  = palette.grayColors.gray0
        primaryButton_Default_Black_Diabled_Text = palette.grayColors.gray20
        
        textButton_Default_Green_Normal_Text   = palette.baseColor.base3
        textButton_Default_Green_Disabled_Text = palette.grayColors.gray70
        
        textButton_Default_Black_Normal_Text   = palette.baseColor.base1
        textButton_Default_Black_Disabled_Text = palette.grayColors.gray70
        
        textButton_Default_White_Normal_Text   = palette.baseColor.base2
        textButton_Default_White_Disabled_Text = palette.grayColors.gray300
        
        
    }

    // Generic
    private var _primaryBackground : UIColor = UIColor.clear
    private var _secondaryBackground  : UIColor = UIColor.clear
    var primaryBackground: UIColor { get { return _primaryBackground } set { _primaryBackground = newValue }}
    var secondaryBackground : UIColor { get { return _secondaryBackground }  set { _secondaryBackground  = newValue }}
    
    // MARK:  Bottom Navigation
    private var _navBar_selected         : UIColor = UIColor.clear
    private var _navBar_unselected       : UIColor = UIColor.clear
    private var _navBar_Text_Selected    : UIColor = UIColor.clear
    private var _navBar_Text_Normal      : UIColor = UIColor.clear
    
    private var _navBar_selected_secondary         : UIColor = UIColor.clear
    private var _navBar_unselected_secondary       : UIColor = UIColor.clear
    private var _navBar_Text_Selected_secondary    : UIColor = UIColor.clear
    private var _navBar_Text_Normal_secondary      : UIColor = UIColor.clear
    
    
    var navBar_selected         : UIColor { get { return _navBar_selected }         set { _navBar_selected      = newValue}}
    var navBar_unselected       : UIColor { get { return _navBar_unselected }       set { _navBar_unselected    = newValue }}
    var navBar_Text_Selected    : UIColor { get { return _navBar_Text_Selected }    set { _navBar_Text_Selected = newValue }}
    var navBar_Text_Normal      : UIColor { get { return _navBar_Text_Normal }      set { _navBar_Text_Normal   = newValue }}
    
    var navBar_selected_secondary          : UIColor { get { return _navBar_selected_secondary  }         set { _navBar_selected      = newValue}}
    var navBar_unselected_secondary        : UIColor { get { return _navBar_unselected_secondary  }       set { _navBar_unselected    = newValue }}
    var navBar_Text_Selected_secondary     : UIColor { get { return _navBar_Text_Selected_secondary  }    set { _navBar_Text_Selected = newValue }}
    var navBar_Text_Normal_secondary       : UIColor { get { return _navBar_Text_Normal_secondary  }      set { _navBar_Text_Normal   = newValue }}
    
    // MARK: - Buttons
    
    private var _primaryButton_Default_Black_Normal         : UIColor = UIColor.clear
    private var _primaryButton_Default_Black_Diabled        : UIColor = UIColor.clear
    private var _primaryButton_Default_White_Diabled        : UIColor = UIColor.clear
    
    private var _primaryButton_Default_Black_Normal_Text    : UIColor = UIColor.clear
    private var _primaryButton_Default_Black_Diabled_Text   : UIColor = UIColor.clear
    private var _primaryButton_Default_White_Diabled_Text   : UIColor = UIColor.clear
    
    private var _textButton_Default_Green_Normal            : UIColor = UIColor.clear
    private var _textButton_Default_Green_Disabled          : UIColor = UIColor.clear
    
    private var _textButton_Default_Green_Normal_Text       : UIColor = UIColor.clear
    private var _textButton_Default_Green_Disabled_Text     : UIColor = UIColor.clear
    
    private var _textButton_Default_Black_Normal            : UIColor = UIColor.clear
    private var _textButton_Default_Black_Disabled          : UIColor = UIColor.clear
    private var _textButton_Default_Black_Normal_Text       : UIColor = UIColor.clear
    private var _textButton_Default_Black_Disabled_Text     : UIColor = UIColor.clear
    
    private var _textButton_Default_White_Normal            : UIColor = UIColor.clear
    private var _textButton_Default_White_Disabled          : UIColor = UIColor.clear
    private var _textButton_Default_White_Normal_Text       : UIColor = UIColor.clear
    private var _textButton_Default_White_Disabled_Text     : UIColor = UIColor.clear
    
    
    var primaryButton_Default_Black_Normal       : UIColor { get { return _primaryButton_Default_Black_Normal }       set { _primaryButton_Default_Black_Normal       = newValue}}
    var primaryButton_Default_Black_Diabled      : UIColor { get { return _primaryButton_Default_Black_Diabled }      set { _primaryButton_Default_Black_Diabled      = newValue}}
    var primaryButton_Default_White_Diabled      : UIColor { get { return _primaryButton_Default_White_Diabled }      set { _primaryButton_Default_White_Diabled      = newValue}}
    
    var primaryButton_Default_Black_Normal_Text  : UIColor { get { return _primaryButton_Default_Black_Normal_Text }  set { _primaryButton_Default_Black_Normal_Text  = newValue}}
    var primaryButton_Default_Black_Diabled_Text : UIColor { get { return _primaryButton_Default_Black_Diabled_Text } set { _primaryButton_Default_Black_Diabled_Text = newValue}}
    var primaryButton_Default_White_Diabled_Text : UIColor { get { return _primaryButton_Default_White_Diabled_Text } set { _primaryButton_Default_White_Diabled_Text = newValue}}
    
    var textButton_Default_Green_Normal          : UIColor { get { return _textButton_Default_Green_Normal }          set { _textButton_Default_Green_Normal          = newValue}}
    var textButton_Default_Green_Disabled        : UIColor { get { return _textButton_Default_Green_Disabled }        set { _textButton_Default_Green_Disabled        = newValue}}
    
    var textButton_Default_Green_Normal_Text     : UIColor { get { return _textButton_Default_Green_Normal_Text }     set { _textButton_Default_Green_Normal_Text     = newValue}}
    var textButton_Default_Green_Disabled_Text   : UIColor { get { return _textButton_Default_Green_Disabled_Text }   set { _textButton_Default_Green_Disabled_Text   = newValue}}
    
    var textButton_Default_Black_Normal          : UIColor { get { return _textButton_Default_Black_Normal }          set { _textButton_Default_Black_Normal          = newValue}}
    var textButton_Default_Black_Disabled        : UIColor { get { return _textButton_Default_Black_Disabled }        set { _textButton_Default_Black_Disabled        = newValue}}
    var textButton_Default_Black_Normal_Text     : UIColor { get { return _textButton_Default_Black_Normal_Text }     set { _textButton_Default_Black_Normal_Text     = newValue}}
    var textButton_Default_Black_Disabled_Text   : UIColor { get { return _textButton_Default_Black_Disabled_Text }   set { _textButton_Default_Black_Disabled_Text   = newValue}}
    
    var textButton_Default_White_Normal          : UIColor { get { return _textButton_Default_White_Normal }          set { _textButton_Default_White_Normal          = newValue}}
    var textButton_Default_White_Disabled        : UIColor { get { return _textButton_Default_White_Disabled }        set { _textButton_Default_White_Disabled        = newValue}}
    var textButton_Default_White_Normal_Text     : UIColor { get { return _textButton_Default_White_Normal_Text }     set { _textButton_Default_White_Normal_Text     = newValue}}
    var textButton_Default_White_Disabled_Text   : UIColor { get { return _textButton_Default_White_Disabled_Text }   set { _textButton_Default_White_Disabled_Text   = newValue}}
}

