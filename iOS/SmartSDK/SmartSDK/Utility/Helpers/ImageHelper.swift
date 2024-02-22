//
//  ImageHelper.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 06/07/23.
//

import Foundation
import UIKit
import SVGKit

class ImageHelper{
    
    func createImageFromSVG(imageName:String,size:CGSize) -> UIImage{
        
        var tempImage = UIImage()
        
        let imageNamewithExtention = imageName + ".svg"
        
        var validImageFileName = ""
        
        _ = FileManager.default
        
        let bundle = Bundle(for: Self.self)
        
        let defaultPath = bundle.path(forResource: ThemeConstants.defaultPlaceholderImageName, ofType: nil)

        if let path = bundle.path(forResource: imageNamewithExtention, ofType: nil) {
            validImageFileName = path
        } else {
            validImageFileName = defaultPath!
        }
        
        
        let svgImage = SVGKImage(contentsOfFile: validImageFileName)
        
        // Convert the SVG image to a UIImage
        let renderer = UIGraphicsImageRenderer(size: size)
        tempImage = renderer.image { _ in
            svgImage?.uiImage.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return tempImage
        
    }
    
    // Create a function that loads an image from a URL
    func loadImageFromURL(urlString: String, completion: @escaping (UIImage?) -> Void) {
        // Create a URL object from the provided string
        if let url = URL(string: urlString) {
            // Create a URLSessionDataTask to download the image data
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Check for any errors
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                // Check if there is any data returned
                if let data = data {
                    // Create an UIImage object from the downloaded data
                    let image = UIImage(data: data)
                    completion(image)
                    return
                }
                
                // If there is no data, call the completion handler with nil
                completion(nil)
            }.resume()
        } else {
            // If the provided URL string is not valid, call the completion handler with nil
            completion(nil)
        }
    }
    
}

extension UIImage {
    
    func resizeImage(newSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
    
    var roundMyImage: UIImage {
            let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
            UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
            UIBezierPath(
                roundedRect: rect,
                cornerRadius: self.size.height
                ).addClip()
            self.draw(in: rect)
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    
    func squareMyImage() -> UIImage {
            UIGraphicsBeginImageContext(CGSize(width: self.size.width, height: self.size.width))

            self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.width))

            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage!
        }
}
