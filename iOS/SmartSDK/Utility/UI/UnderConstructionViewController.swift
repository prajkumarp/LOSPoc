//
//  UnderConstructionViewController.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 27/07/23.
//

import Foundation
import UIKit
import Lottie

class UnderConstructionViewController: UIViewController{
    
    private var inProgressView: LottieAnimationView?
    var refreshControl = UIRefreshControl()
    var scrollView: UIScrollView!
    var contentView: UIView!
    var isSettoAim:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        isSettoAim = false
        
        // Initialize the scroll view
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set the content size of the scroll view
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.backgroundColor = view.backgroundColor
        
        // Add the scroll view to the view hierarchy
        view.addSubview(scrollView)
        
        // Add your content to the scroll view
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 2))
        contentView.backgroundColor = view.backgroundColor
        scrollView.addSubview(contentView)
        
        self.addInProgressAnimation()
        
        // Add the refresh control to your scroll view
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        scrollView.addSubview(refreshControl)
        
    }
    
    func addInProgressAnimation(){
        
        // Start LottieAnimationView with animation name (without extension)
        
        inProgressView?.stop()
        
        inProgressView?.removeFromSuperview()
        
        inProgressView = nil
        
        if (isSettoAim){
            inProgressView = .init(name: "aim1")
        }else{
            inProgressView = .init(name: self.getRandomUnderConstructionLottieName())
        }
        // Set animation content mode
        
        inProgressView!.contentMode = .scaleAspectFit
        
        // Set animation loop mode
        
        inProgressView!.loopMode = .loop
        
        // Adjust animation speed
        
        inProgressView!.animationSpeed = 1
        
        // Add to the main view
        
        
        
        view.addSubview(inProgressView!)
        
        // Set constraints to fill the screen
        
        inProgressView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inProgressView!.widthAnchor.constraint(equalToConstant: 150),
            inProgressView!.heightAnchor.constraint(equalToConstant: 150),
            inProgressView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inProgressView!.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        inProgressView?.play()
    }
    
    @objc private func refresh(_ sender: Any) {
        // Handle the refresh event here
        addInProgressAnimation()
        // Call the endRefreshing method when you finish refreshing the content
        refreshControl.endRefreshing()
    }
    
    private func getRandomUnderConstructionLottieName()->String{
        let returnString = "UnderConstruction" + random(range: 1...15).description
        print(returnString)
        return returnString
    }
    
    // Generate a random number within a range
    func random(range: ClosedRange<Int>) -> Int {
        let lowerBound = range.lowerBound
        let upperBound = range.upperBound
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
    }
    
}
