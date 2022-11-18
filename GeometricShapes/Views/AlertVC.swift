//
//  AlertVC.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

class AlertVC: UIViewController {
    
    let containerView = AlertContainerView()
       let titleLabel = ShapesLabel(text: "", textAlignment: .center, fontSize: 20, weight: .bold)
       let messageLabel = ShapesLabel(text: "", textAlignment: .center, fontSize: 16, weight: .regular)
    let actionButton = ShapesButton(backgroundColor: UIColor.init(hex: "#96DED1"), title: "Ok")
    
       
       var alertTitle: String?
       var message: String?
       var buttonTitle: String?
       
       let padding: CGFloat = 20
       
       init(alertTitle: String, message: String, buttonTitle: String) {
           super.init(nibName: nil, bundle: nil)
           self.alertTitle = alertTitle
           self.message = message
           self.buttonTitle = buttonTitle
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
               configureContainerView()
               configureTitleLabel()
               configureActionButton()
               configureMessageLabel()
        
    }
    
    func configureContainerView() {
           view.addSubview(containerView)

           containerView.snp.makeConstraints { make in
               make.centerX.centerY.equalTo(view)
               make.height.equalTo(220)
               make.width.equalTo(280)
           }
       }

       func configureTitleLabel() {
           containerView.addSubview(titleLabel)
           titleLabel.text = alertTitle ?? "Something went wrong"

           titleLabel.snp.makeConstraints { make in
               make.top.equalTo(containerView).offset(20)
               make.leading.equalTo(containerView).offset(20)
               make.trailing.equalTo(containerView).offset(-20)
               make.height.equalTo(28)
           }
       }

       
       func configureActionButton() {
           containerView.addSubview(actionButton)
           actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
           actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
           
           actionButton.snp.makeConstraints { make in
               make.bottom.equalTo(containerView.snp.bottom).offset(-20)
               make.leading.equalTo(containerView).offset(20)
               make.trailing.equalTo(containerView).offset(-20)
               make.height.equalTo(44)
           }
       }

       
       func configureMessageLabel() {
           containerView.addSubview(messageLabel)
           messageLabel.text = message ?? "Unable to complete request"
           messageLabel.numberOfLines  = 4

           messageLabel.snp.makeConstraints { make in
               make.top.equalTo(titleLabel.snp.bottom).offset(8)
               make.leading.equalTo(containerView).offset(20)
               make.trailing.equalTo(containerView).offset(-20)
               make.bottom.equalTo(actionButton.snp.top).offset(-12)
           }
       }
       
       
       @objc func dismissVC() {
           dismiss(animated: true)
       }

    

    

}
