//
//  Ext+UIViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

extension UIViewController {

    func twoLineTitleView(text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: UIScreen.main.bounds.width - 200,
                                          height: 44))
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.label
        label.lineBreakMode = .byWordWrapping
        label.text = text
        return label
    }
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }

}


