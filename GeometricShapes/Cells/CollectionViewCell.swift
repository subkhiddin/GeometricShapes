//
//  CollectionViewCell.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellID"
        
        let shapesImageView = ShapesImageView(image: UIImage(named: "Sphere")!)
        let shapesName = ShapesLabel(text: "Sphere", textAlignment: .center, fontSize: 20, weight: .bold)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configureUI()
            addSubview()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureUI() {
            backgroundColor = UIColor.init(hex: "000000").withAlphaComponent(0.1)
            layer.cornerRadius = 20
        }
        
        private func addSubview() {
            addSubview(shapesImageView)
            addSubview(shapesName)
        }
        
        private func setConstraints() {
            shapesImageView.snp.makeConstraints { make in
                make.top.left.right.equalTo(self)
                make.bottom.equalTo(self.snp.bottom).offset(-40)
            }
            
            shapesName.snp.makeConstraints { make in
                make.left.right.equalTo(self)
                make.bottom.equalTo(self.snp.bottom)
                make.top.equalTo(shapesImageView.snp.bottom)
            }
            
        }
        
        func setAnimalImage(image: UIImage, name: String) {
            shapesImageView.image = image
            shapesName.text = name
        }
}
