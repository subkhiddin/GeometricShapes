//
//  SlideInPresentationManager.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit

enum PresentationDirection {
    case left
    case top
    case right
    case bottom
}


class SlideInPresentationManager: NSObject {
    var direction = PresentationDirection.left
       var height: CGFloat = 0
       
       override init() {
           super.init()
       }
}
// MARK: - UIViewControllerTransitioningDelegate
extension SlideInPresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedViewController: presented,
                                                                   presenting: presenting,
                                                                   direction: direction, height: height)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }
} 
