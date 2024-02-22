//
//  WebviewWithViewController.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 12/10/23.
//

import Foundation
import UIKit
import WebKit

class WebviewWithViewController : UIViewController{
    
    var titleText : String = ""
    var subTitleText : String = ""
    var urlPath   : String = ""
    var showBack  : Bool = true
    var showClose : Bool = true
    var showTitle : Bool = true
    var ctaValues : ctaControl?
    
    var webView: WKWebView = WKWebView()
    let headerView : UIView =  UIView(frame: CGRectZero)
    var backButton : UIButton = UIButton(frame: CGRectZero)
    var closeButton: UIButton = UIButton(frame: CGRectZero)
    let titleLabel : UILabel = UILabel(frame: CGRectZero)
    
    var webviewTopAnchorConstant = 0
    var webviewBottomAnchorConstant = 0
    var leadingAnchorConstant = 0
    var trailingAnchorConstant = 0
    // MARK: - Lifecycle
    
    convenience init(title: String, subTitle: String, urlPath: String, showBack: Bool, showClose: Bool) {
        self.init()
        self.titleText = title
        self.subTitleText = subTitle
        self.urlPath = urlPath
        self.showBack = showBack
        self.showClose = showClose
    }
    
    convenience init(_ctaValues : ctaControl){
        self.init()
        self.ctaValues = _ctaValues
        self.showBack = (ctaValues!.header.showBack)
        self.showClose = (ctaValues!.header.showClose)
        self.showTitle = (ctaValues!.header.isVisible)
        self.urlPath = ctaValues!.url
        self.titleText = ctaValues!.displaytext
    }
    
    
    override func viewDidLoad(){
        self.setupUI()
        self.setBackButtonVisibility(should: self.showBack)
        self.setCloseButtonStateVisbiity(should: self.showClose)
        self.loadWebPage(for: self.urlPath)
    }
    
    func loadWebPage(for urlPath:String) {
        guard let url = URL(string: urlPath) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - Navigation
    func setBackButtonVisibility(should show:Bool){
        self.backButton.isHidden = !show
    }
    
    func setCloseButtonStateVisbiity(should show:Bool){
        self.closeButton.isHidden = !show
    }
    
    @objc private func backButtonClicked(_ sender: UIButton){
        
        if (webView.backForwardList.backList.count > 0){
            webView.goBack()
        }else{
            let nvc = self.navigationController
            if ((nvc) != nil){
                self.navigationController?.popViewController(animated: true)
            }else{
                self.dismiss(animated: true)
            }
            
        }
    }
    
    @objc func CloseButtonClicked(_ sender: UIButton)  {
        let nvc = self.navigationController
        if ((nvc) != nil){
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI(){
        
        if(navigationController != nil){
            
            self.view.backgroundColor = .white
            
            if(showBack){
                let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButtonClicked(_:)))
                backButton.image = UIImage(systemName: "arrow.left")!.withTintColor(.blue, renderingMode: .alwaysTemplate)
                backButton.tintColor = .black
                self.navigationItem.leftBarButtonItem = backButton
            }else{
                self.navigationItem.hidesBackButton = true
            }
            
            let closeButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(CloseButtonClicked(_:)))
            closeButton.image = UIImage(systemName: "xmark.circle")!.withTintColor(.blue, renderingMode: .alwaysTemplate)
            closeButton.tintColor = .black
            self.navigationItem.rightBarButtonItem = closeButton
            
            self.navigationItem.title = self.titleText
            
            webviewTopAnchorConstant = 100
            
            self.showClose = false
            self.showBack = false
            self.showTitle = false
            self.setupHeader()
            self.setupWebView()
        }
        else{
            
            if(ctaValues?.windowType == .bottomSheet){
                self.view.backgroundColor = .white
            }else if (ctaValues?.windowType == .modal){
                self.view.backgroundColor = .clear
                webviewTopAnchorConstant = -8
                webviewBottomAnchorConstant = -80
                leadingAnchorConstant = 40
                trailingAnchorConstant = -40
                
                headerView.clipsToBounds = true
                headerView.layer.cornerRadius = 8
                
                webView.clipsToBounds = true
                webView.layer.cornerRadius = 8
            }
            self.setupBackButton()
            self.setupCloseButton()
            self.setupTitle()
            self.setupHeader()
            self.setupWebView()
        }
    }
    
    private func setupBackButton(){
        backButton = UIButton(frame: CGRectZero)
        backButton.addTarget(self, action: #selector(backButtonClicked(_:)), for: .touchUpInside)
        backButton.setBackgroundImage(UIImage(systemName: "arrow.left")!.withTintColor(.blue, renderingMode: .alwaysTemplate), for: .normal)
        backButton.tintColor = .black
    }
    
    private func setupCloseButton(){
        closeButton = UIButton(frame: CGRectZero)
        closeButton.addTarget(self, action: #selector(CloseButtonClicked(_:)), for: .touchUpInside)
        closeButton.setBackgroundImage(UIImage(systemName: "xmark.circle")!.withTintColor(.blue, renderingMode: .alwaysTemplate), for: .normal)
        closeButton.tintColor = .black
    }
    
    private func setupTitle(){
        navigationItem.hidesBackButton = true
//         Create the title for the page
        titleLabel.text = self.titleText
        titleLabel.textColor = ThemeManager.sharedInstance.primaryTheme.palette.baseColor.base1
        titleLabel.font = ThemeManager.sharedInstance.primaryTheme.fonts.primaryFont.bold.withSize(20)
    }
    
    private func setupHeader(){
        
        var heightofHeader = 0
        headerView.translatesAutoresizingMaskIntoConstraints = false

        if(showBack){
            headerView.addSubview(backButton)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 8).isActive = true
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 16).isActive = true
            backButton.heightAnchor.constraint(equalToConstant:CGFloat(28)).isActive = true
            backButton.widthAnchor.constraint(equalToConstant:CGFloat(28)).isActive = true
            heightofHeader = 48
        }
        
        if(showClose){
            headerView.addSubview(closeButton)
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            closeButton.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 8).isActive = true
            closeButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -16).isActive = true
            closeButton.heightAnchor.constraint(equalToConstant:CGFloat(28)).isActive = true
            closeButton.widthAnchor.constraint(equalToConstant:CGFloat(28)).isActive = true
            heightofHeader = 48
        }
        
        
        if(showTitle){
            headerView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 8).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 48).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -48).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant:CGFloat(32)).isActive = true
            heightofHeader = 48
        }

        
        self.view.addSubview(headerView)
        
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 8).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: CGFloat(leadingAnchorConstant)).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: CGFloat(trailingAnchorConstant)).isActive = true
        headerView.heightAnchor.constraint(equalToConstant:CGFloat(heightofHeader)).isActive = true
        
        headerView.backgroundColor = .white

    }
    
    private func setupWebView(){
        
        self.view.addSubview(webView)
        
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: CGFloat(webviewTopAnchorConstant)).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: CGFloat(webviewBottomAnchorConstant)).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: CGFloat(leadingAnchorConstant)).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: CGFloat(trailingAnchorConstant)).isActive = true
    }
    
    
}

extension WebviewWithViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // Show a loading indicator or perform other tasks when webpage starts loading
        print("loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Perform tasks when webpage finishes loading
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // Handle errors when webpage fails to load
    }
    
    // Monitor URL redirection using the decidePolicyFor method
       func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
           
//           // Check the URL of the navigation action
//           if let url = navigationAction.request.url?.absoluteString {
//               if (url != self.urlPath){
//                   print("Redirecting to: \(url)")
//                   let viewController  = WebviewWithViewController(title: "", subTitle: "", urlPath: url, showBack: self.showBack, showClose: self.showClose)
//                   self.navigationController!.pushViewController(viewController, animated: true)
//                   decisionHandler(.cancel)
//               }else{
//                   decisionHandler(.allow)
//               }
//             
//           }
           
           decisionHandler(.allow)
       }
}
