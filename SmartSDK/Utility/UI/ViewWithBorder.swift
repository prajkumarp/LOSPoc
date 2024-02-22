//
//  ViewWithBorder.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 11/09/23.
//

import Foundation
import UIKit

class ViewWithBorder:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        // Customize and configure your view here
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1.0
        self.layer.borderColor = ProfileModuleTheme().profile_SectionBorder_Color.cgColor
        self.layer.cornerRadius = 10.0
    }
    
    func updateBorderColor(with color:UIColor){
        self.layer.borderColor = color.cgColor
    }
    
    func updateBorderRadius(with radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    
}
