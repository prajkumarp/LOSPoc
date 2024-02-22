//
//  ViewController.swift
//  SmartShell
//
//  Created by Rajkumar.Panneerselvam on 12/02/24.
//

import UIKit
import Foundation
import SmartSDK

class ViewController: UIViewController {
    
    var sdkInstance = SmartFramework.sharedInstance
    
    
    // MARK: - Local variables
    
    // MARK: - UI referances
    // MARK: Elements
    @IBOutlet weak var launchButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
        sdkInstance.setLaunchConfig(filename: "layout1")
        
    }
    
    private func setupUI(){
        self.view.backgroundColor = .white
        
        let launchButton = UIButton(frame: CGRectZero)
        
        launchButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        launchButton.setTitle(NSLocalizedString("Launch", comment: "Launch"), for: .normal)
//        launchButton.titleLabel?.font = ThemeManager().primaryTheme.fonts.primaryFont.medium.withSize(14)
        launchButton.titleLabel?.textColor = .black
        launchButton.backgroundColor = .gray
        launchButton.layer.cornerRadius = 18
        
        self.view.addSubview(launchButton)
        
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        launchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        launchButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        launchButton.heightAnchor.constraint(equalToConstant: 36).isActive = true

    }


    // MARK: - Delegates
    
    
    // MARK: - Responsders
    
    @objc private func buttonTapped(_ sender: UIButton) {
        // Implement the method to be called when the button is tapped
        let landingPage = UINavigationController(rootViewController: sdkInstance.getLandingPage())
        
        landingPage.modalPresentationStyle = .fullScreen
        landingPage.modalTransitionStyle = .coverVertical
        
        self.present(landingPage, animated: true, completion: nil)
    }
}

