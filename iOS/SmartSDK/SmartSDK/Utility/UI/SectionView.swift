//
//  SectionView.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 11/09/23.
//

import Foundation
import UIKit

class SectionView:UIView{
    
    var sectionHeader :UILabel?
    var sectionBody:ViewWithBorder?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        sectionHeader = UILabel(frame: CGRectZero)
        sectionBody = ViewWithBorder(frame: CGRectZero)
        sectionHeader?.textColor = ThemeManager.sharedInstance.primaryTheme.palette.grayColors.gray60
        sectionHeader?.font = ThemeManager.sharedInstance.primaryTheme.fonts.bodyRegular12
    }
    
    func setupConstraints(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        sectionHeader?.translatesAutoresizingMaskIntoConstraints = false
        sectionBody?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(sectionHeader!)
        self.addSubview(sectionBody!)
        
        NSLayoutConstraint.activate([
            sectionHeader!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sectionHeader!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            sectionHeader!.topAnchor.constraint(equalTo: self.topAnchor),
            sectionHeader!.heightAnchor.constraint(equalToConstant: 16),
            
            sectionBody!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sectionBody!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            sectionBody!.topAnchor.constraint(equalTo: sectionHeader!.bottomAnchor,constant: 8),
            sectionBody!.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    
}
