//
//  BottomSheetViewController.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 09/08/23.
//

import Foundation
import UIKit

protocol BottomSheetViewDelegate{
    
    func bottomSheetWillShow()
    func bottomSheetWillHide()
}

class BottomSheetView: UIView {

    var bottomSheetHeight: CGFloat = 316
    var animationDuration: TimeInterval = 0.3
    var delegate : BottomSheetViewDelegate?

    private var initialYPosition: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBottomSheet()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBottomSheet()
    }

    private func setupBottomSheet() {
        backgroundColor = .red

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(gestureRecognizer)
    }

    @objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let superview = superview else { return }

        let translation = gestureRecognizer.translation(in: superview)

        switch gestureRecognizer.state {
        case .began:
            initialYPosition = frame.origin.y
        case .changed:
            if translation.y > 0 {
                let newYPosition = initialYPosition + translation.y
                frame.origin.y = newYPosition
            }
        case .ended, .cancelled:
            if translation.y > 0 {
                if frame.origin.y > superview.frame.maxY - bottomSheetHeight / 2 {
                    hideBottomSheet()
                } else {
                    showBottomSheet()
                }
            }
        default:
            break
        }
    }

    func showBottomSheet() {
        delegate?.bottomSheetWillShow()
        guard let superview = superview else { return }

        UIView.animate(withDuration: animationDuration) {
            self.frame.origin.y = superview.frame.maxY - self.bottomSheetHeight
        }
    }

    func hideBottomSheet() {
        delegate?.bottomSheetWillHide()
        guard let superview = superview else { return }

        UIView.animate(withDuration: animationDuration) {
            self.frame.origin.y = superview.frame.maxY
        }
    }
}

