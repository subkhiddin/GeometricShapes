//
//  AlertContainerView.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

class AlertContainerView: UIView {

    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            backgroundColor = .systemBackground
            layer.cornerRadius = 16
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
            translatesAutoresizingMaskIntoConstraints = false
        }

}
