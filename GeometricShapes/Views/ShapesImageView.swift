//
//  ShapesImageView.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

class ShapesImageView: UIImageView {

    init(image: UIImage) {
           super.init(frame: .zero)
           self.image = image
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       private func configure() {
           layer.cornerRadius  = 10
           clipsToBounds = true
           contentMode = .scaleAspectFit
       }

}
