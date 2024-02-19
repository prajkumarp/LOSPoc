//
//  ModuleMapping.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 06/07/23.
//

import Foundation
import UIKit

struct ModuleMapping{
    
    func getTabName(tab:TabSections) -> String {
        
        switch(tab){
        case .homeTab:     return Constants.home
        case .cash:     return Constants.cash
        case .profile:  return Constants.profile
        case .purchases:return Constants.purchases
        case .shop:     return Constants.shop
        }
    }
    
    func getIconforTab(tab:TabSections) -> UIImage {
        
        var imageName:String = ""
        let imageSize:CGSize = CGSize(width: Constants.tabImageWidth, height: Constants.tabImageHeight)
        
        switch(tab){
        case .cash:     imageName = Constants.cashTabImage
        case .homeTab:     imageName = Constants.homeTabImage
        case .profile:  imageName = Constants.profileTabImage
        case .purchases:imageName = Constants.purchasesTabImage
        case .shop:     imageName = Constants.shopTabImage
        }
        
        return ImageHelper().createImageFromSVG(imageName: imageName,size: imageSize)
    }
    
}
