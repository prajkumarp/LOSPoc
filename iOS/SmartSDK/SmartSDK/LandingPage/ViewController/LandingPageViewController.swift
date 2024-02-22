//
//  LandingPage.swift
//  SmartSDK
//
//  Created by Rajkumar.Panneerselvam on 12/02/24.
//

import Foundation
import UIKit
import WebKit

class LandingPageViewController: UIViewController{
    
    var launchConfig : LaunchPageScreenObject?
    
    var headerView: UIView!
    var scrollView:UIScrollView!
    var stackView:UIStackView!
   
    var contentSize = 200
    
    // MARK: - Lifecycle
    
    convenience init(for config: LaunchPageScreenObject){
        self.init()
        launchConfig = config
    }
    
    override func viewDidLoad(){
        self.setupUI()
    }
    
    private func setupUI(){
        
        self.view.backgroundColor = ThemeManager.sharedInstance.primaryTheme.palette.grayColors.gray10
        
        headerView = UIView(frame: CGRectZero)
        
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 114).isActive = true
        
        headerView.backgroundColor = ThemeManager.sharedInstance.primaryTheme.palette.grayColors.gray10
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 114, width: view.frame.width, height: (view.frame.height - 114)))
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        scrollView.backgroundColor = .white
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        stackView = UIStackView(frame: scrollView.bounds)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        
        self.createSections()
        self.setupBottomFiller()
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: CGFloat(contentSize))
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        view.addSubview(scrollView)
        
    }
    
    
    private func createUIControl(ctaValues : ctaControl) -> UIButton{
        
        let returnControl = UIButton()
        returnControl.tag = ctaValues.index
        
        return returnControl
    }
    
    private func createSections(){
        
        for control in launchConfig!.launchPageControls{
            
            print(control.displaytext)
            
            let height = 56
            
            let button = UIButton(type: .system)
            button.setTitle(control.displaytext, for: .normal)
            button.setTitleColor(ThemeManager.sharedInstance.primaryTheme.palette.grayColors.gray80, for: .normal)
            button.titleLabel?.font = ThemeManager.sharedInstance.primaryTheme.fonts.bodyRegular16
            button.contentHorizontalAlignment = .left
            button.semanticContentAttribute = .forceRightToLeft
            button.layer.name = String(control.index)
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
            button.tag = control.index
            
            stackView.addArrangedSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            button.widthAnchor.constraint(equalToConstant: CGFloat(self.view.bounds.width-32)).isActive = true
            
        }
    }
    
    private func setupBottomFiller(){
        
        let heightOfView = 50
        
        let viewInstance = UIView()
        viewInstance.backgroundColor = .clear
        
        stackView.addArrangedSubview(viewInstance)
        
        viewInstance.translatesAutoresizingMaskIntoConstraints = false
        viewInstance.heightAnchor.constraint(equalToConstant: CGFloat(heightOfView)).isActive = true
        viewInstance.widthAnchor.constraint(equalToConstant: scrollView.bounds.width).isActive = true
        
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        
        let selectedIndex = Int(sender.layer.name!)
        let selectedItem = launchConfig?.launchPageControls[selectedIndex!]
        
        switch selectedItem?.renderMode{
            
        case .web:
            renderWebview(selectedItem: selectedItem!)
        case .hybrid:
            doNothing()
        case .native:
            doNothing()
        case .none:
            renderWebview(selectedItem: selectedItem!)
        }
    }
    
    private func renderWebview(selectedItem:ctaControl){
        
        switch selectedItem.windowType{
            
        case .fullScreen:
            do {
                let webviewController = WebviewWithViewController(_ctaValues: selectedItem)
                navigationController?.pushViewController(webviewController, animated: true)
            }
        case .modal:
            do {
                let webviewController = WebviewWithViewController(_ctaValues: selectedItem)
                webviewController.modalPresentationStyle = .popover
                webviewController.isModalInPresentation = true
                self.present(webviewController, animated: true, completion: nil)
            }
        case .bottomSheet:
            do {
                let webviewController = WebviewWithViewController(_ctaValues: selectedItem)
                webviewController.modalPresentationStyle = .popover
                webviewController.isModalInPresentation = true
                self.present(webviewController, animated: true, completion: nil)
            }
        }
        
    }
    
    private func doNothing(){
        
    }
    
   
}

