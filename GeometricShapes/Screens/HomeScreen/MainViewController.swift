//
//  MainViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

let myScreen = UIScreen.main.bounds

class MainViewController: UIViewController {
    
    let mainImageView = ShapesImageView(image: UIImage(named: "ShapeLogo")!)
    let mainLabel = ShapesLabel(text: "Explore the Geometric shapes",textAlignment: .center, fontSize: 22, weight: UIFont.Weight.bold)
    let learnShapesBtn = ShapesButton(backgroundColor: UIColor.init(hex: "#96DED1"), title: "Explore Shapes")
    let guessShapesBtn = ShapesButton(backgroundColor: UIColor.init(hex: "#96DED1"), title: "Guess the Shapes")
    let shapesQuizBtn = ShapesButton(backgroundColor: UIColor.init(hex: "#96DED1"), title: "Take a quiz")
    let favoriteShapesBtn = ShapesButton(backgroundColor: UIColor.init(hex: "#96DED1"), title: "Favorite Shapes")
    
    override func viewDidLoad() {
        
        configureUI()
        addSubviews()
        setConstraints()
        addTargets()
    }
    
    private func addTargets() {
           learnShapesBtn.addTarget(self, action: #selector(learnShapesBtnTapped), for: .touchUpInside)
           guessShapesBtn.addTarget(self, action: #selector(guessShapesBtnTpped), for: .touchUpInside)
           shapesQuizBtn.addTarget(self, action: #selector(shapesQuizBtnTapped), for: .touchUpInside)
           favoriteShapesBtn.addTarget(self, action: #selector(favoriteShapesBtnTapped), for: .touchUpInside)
       }
       
       @objc func learnShapesBtnTapped() {
           let vc = ExploreShapesViewController()
           navigationController?.pushViewController(vc, animated: true)
       }
       
       @objc func guessShapesBtnTpped() {
           let vc = GuessShapesViewController()
           navigationController?.pushViewController(vc, animated: true)
       }
       
       @objc func shapesQuizBtnTapped() {
           let vc = TakeQuizViewController()
           navigationController?.pushViewController(vc, animated: true)
       }
       
       @objc func favoriteShapesBtnTapped() {
           let vc = FavoriteViewController()
           navigationController?.pushViewController(vc, animated: true)
       }
       
       private func configureUI() {
           view.backgroundColor = UIColor.systemBackground
       }
       
       private func addSubviews() {
           view.addSubview(mainImageView)
           view.addSubview(mainLabel)
           view.addSubview(learnShapesBtn)
           view.addSubview(shapesQuizBtn)
           view.addSubview(guessShapesBtn)
           view.addSubview(favoriteShapesBtn)
       }
       
       private func setConstraints() {
           mainImageView.snp.makeConstraints { make in
               make.top.equalTo(view.snp.top).offset(80)
               make.leading.equalTo(view.snp.leading).offset(1)
               make.trailing.equalTo(view.snp.trailing)
               make.height.equalTo(myScreen.height / 3.2)
           }
           
           mainLabel.snp.makeConstraints { make in
               make.top.equalTo(mainImageView.snp.bottom).offset(20)
               make.leading.equalTo(view.snp.leading)
               make.trailing.equalTo(view.snp.trailing)
               make.height.equalTo(27)
           }
           
           learnShapesBtn.snp.makeConstraints { make in
               make.top.equalTo(mainLabel.snp.bottom).offset(50)
               make.leading.equalTo(view.snp.leading).offset(20)
               make.trailing.equalTo(view.snp.trailing).offset(-20)
               make.height.equalTo(50)
           }
           
           guessShapesBtn.snp.makeConstraints { make in
               make.top.equalTo(learnShapesBtn.snp.bottom).offset(15)
               make.leading.equalTo(view.snp.leading).offset(20)
               make.trailing.equalTo(view.snp.trailing).offset(-20)
               make.height.equalTo(50)
           }
           
           shapesQuizBtn.snp.makeConstraints { make in
               make.top.equalTo(guessShapesBtn.snp.bottom).offset(15)
               make.leading.equalTo(view.snp.leading).offset(20)
               make.trailing.equalTo(view.snp.trailing).offset(-20)
               make.height.equalTo(50)
           }
           
           favoriteShapesBtn.snp.makeConstraints { make in
               make.top.equalTo(shapesQuizBtn.snp.bottom).offset(15)
               make.leading.equalTo(view.snp.leading).offset(20)
               make.trailing.equalTo(view.snp.trailing).offset(-20)
               make.height.equalTo(50)
           }
       }
}
