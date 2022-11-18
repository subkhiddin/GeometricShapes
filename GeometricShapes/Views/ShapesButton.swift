//
//  ShapesButton.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

class ShapesButton: UIButton {

    override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       convenience init(backgroundColor: UIColor, title: String) {
           self.init(frame: .zero)
           self.backgroundColor = backgroundColor
           self.setTitle(title, for: .normal)
       }
       
       private func configure() {
           translatesAutoresizingMaskIntoConstraints = false
           setTitleColor(.white, for: .normal)
           layer.cornerRadius = 10
           titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
       }

}
