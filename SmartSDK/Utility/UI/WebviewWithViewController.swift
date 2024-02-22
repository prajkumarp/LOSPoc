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
    
    var webView: WKWebView = WKWebView()
    let headerView: UIView =  UIView(frame: CGRectZero)
    // MARK: - Lifecycle
    
    convenience init(title: String, subTitle: String, urlPath: String, showBack: Bool, showClose: Bool) {
        self.init()
        self.titleText = title
        self.subTitleText = subTitle
        self.urlPath = urlPath
        self.showBack = showBack
        self.showClose = showClose
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
        
    }
    
    func setCloseButtonStateVisbiity(should show:Bool){
        
    }
    
    @objc func backButtonClicked() {
        
        if (webView.backForwardList.backList.count > 0){
            webView.goBack()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI(){
        self.view.backgroundColor = .white
        self.setupBackButton()
        self.setupHeader()
        self.setupWebView()
    }
    
    private func setupBackButton(){
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButtonClicked))
        backButton.image = ImageHelper().createImageFromSVG(imageName: "Left_back",size: CGSize(width: 24, height: 24))
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    
    private func setupCloseButton(){
        
    }
    
    private func setupHeader(){
        
        var heightOfTitle    : Int = 32
        var heightofSubtitle : Int = 24
        let headerTopAnchor  : Int = 100
        var heightofHeaderView: Int =  8
        
        let titleLabel    : UILabel      = UILabel(frame: CGRectZero)
        let subTitleLabel : UILabel      = UILabel(frame: CGRectZero)
        
        // Create the title for the page
        if (self.titleText != ""){
            titleLabel.text = self.titleText
            titleLabel.textColor = ProfileModuleTheme().profile_Details_PageTitle_Color
            titleLabel.font = ProfileModuleTheme().profile_Details_PageTitle_Font
            heightofHeaderView = heightofHeaderView + heightOfTitle
        }else{
            heightOfTitle = 0
        }
        
        if (self.subTitleText != ""){
            subTitleLabel.text = self.subTitleText
            subTitleLabel.textColor = ProfileModuleTheme().profile_Details_PageSubTitle_Color
            subTitleLabel.font = ProfileModuleTheme().profile_Details_PageSubTitle_Font
            heightofHeaderView = heightofHeaderView + heightofSubtitle
        }else{
            heightofSubtitle = 0
        }
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(subTitleLabel)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: 16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant:CGFloat(heightOfTitle)).isActive = true
       
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 16).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: 16).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant:CGFloat(heightofSubtitle)).isActive = true
        
        
        self.view.addSubview(headerView)
        
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: CGFloat(headerTopAnchor)).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant:CGFloat(heightofHeaderView)).isActive = true

        
    }
    
    private func setupWebView(){
        
        self.view.addSubview(webView)
        
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 8).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -8).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8).isActive = true
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
