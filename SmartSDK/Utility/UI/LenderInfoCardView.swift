//
//  LenderInfoCardView.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 17/10/23.
//

import Foundation
import UIKit

class LenderInfoCardView:ViewWithBorder{
    
    var lenderInformation : LenderInformation = LenderInformation()
    
    var lenderNameLabel : UILabel = UILabel(frame: CGRectZero)
    var lenderIcon : UIImageView = UIImageView(frame: CGRectZero)
    
    convenience init(for lenderInfo:LenderInformation){
        self.init()
        lenderInformation = lenderInfo
        self.Update()
    }
    
    func Update(){
        
        self.addSubview(lenderIcon)
        self.lenderIcon.contentMode = .scaleAspectFit
        self.lenderIcon.translatesAutoresizingMaskIntoConstraints = false
        self.lenderIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.lenderIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.lenderIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        ImageHelper().loadImageFromURL(urlString: lenderInformation.lenderIconPath) { (image) in
            if let image = image {
                // Do something with the image
                print("Image loaded successfully")
                DispatchQueue.main.async { /// execute on main thread
                    self.lenderIcon.image = image
                }
            } else {
                print("Failed to load image")
                self.lenderIcon.image = ImageHelper().createImageFromSVG(imageName: "", size: CGSize(width: 26, height: 26))
            }
        }
        
        let loanFinancedByLabel = UILabel(frame: CGRectZero)
        loanFinancedByLabel.text = NSLocalizedString("Loan financed by", comment: "Loan financed by")
        loanFinancedByLabel.font = Theme().fonts.secondaryFont.regular.withSize(10)
        loanFinancedByLabel.textColor = Theme().palette.grayColors.gray100
        
        self.addSubview(loanFinancedByLabel)
        
        loanFinancedByLabel.translatesAutoresizingMaskIntoConstraints = false
        loanFinancedByLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        loanFinancedByLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        loanFinancedByLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loanFinancedByLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        self.lenderNameLabel.text = lenderInformation.lenderName
        self.lenderNameLabel.font = Theme().fonts.secondaryFont.medium.withSize(12)
        self.lenderNameLabel.textColor = Theme().palette.baseColor.base1
        self.lenderNameLabel.numberOfLines = 2
        self.lenderNameLabel.lineBreakMode = .byWordWrapping
        
        self.addSubview(self.lenderNameLabel)
        
        self.lenderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lenderNameLabel.topAnchor.constraint(equalTo: loanFinancedByLabel.bottomAnchor).isActive = true
        self.lenderNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        self.lenderNameLabel.trailingAnchor.constraint(equalTo: self.lenderIcon.leadingAnchor).isActive = true
        
    }
    
    
}
