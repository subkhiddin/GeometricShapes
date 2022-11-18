//
//  FavoritesTableViewCell.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    static let identifier = "UpcomingTableViewCell"
       
       let image: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
       
       let titleName: UILabel = {
           let titleName = UILabel()
           titleName.font = UIFont.boldSystemFont(ofSize: 17)
           titleName.translatesAutoresizingMaskIntoConstraints = false
           titleName.lineBreakMode = .byWordWrapping
           titleName.numberOfLines = 0
           return titleName
       }()
       
       let button: UIButton = {
           let button = UIButton()
           button.tintColor = .label
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
           return button
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            addSubview(image)
            addSubview(titleName)
            addSubview(button)
            
            applyConstraints()
        }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func applyConstraints() {
            NSLayoutConstraint.activate([
                image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                image.heightAnchor.constraint(equalToConstant: 130),
                image.widthAnchor.constraint(equalToConstant: 200),
                
                
                titleName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
                titleName.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -20),
                titleName.centerYAnchor.constraint(equalTo: image.centerYAnchor),
                titleName.heightAnchor.constraint(equalToConstant: 80),

                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                button.centerYAnchor.constraint(equalTo: image.centerYAnchor),
                button.heightAnchor.constraint(equalToConstant: 50),
                button.widthAnchor.constraint(equalToConstant: 50),
            
            ])
        }
    func configure(with model: Favorite) {
           titleName.text = model.name
           for shape in shapes {
               if model.name == shape.name {
                   image.image = shape.image
               }
           }
       }
}
