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
    
    // MARK: - Local variables
    
    // MARK: - UI referances
    // MARK: Elements
    @IBOutlet weak var launchButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    private func setupUI(){
        self.view.backgroundColor = .red
    }


    // MARK: - Delegates
    
    
    // MARK: - Responsders
    @IBAction func launchButtonTapped(_ sender: Any) {
        
        let sdkInstance = SmartFramework(jsonString: "")
        
        let landingPage = sdkInstance.getLandingPage()
        landingPage.modalPresentationStyle = .fullScreen
        landingPage.modalTransitionStyle = .coverVertical
        
        self.present(landingPage, animated: true, completion: nil)
        
    }
}

