//
//  SlideUpViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit

protocol SlideUpVCProtocol: NSObject {
    func continueTapped()
}

class SlideUpViewController: UIViewController {

    lazy var topLine: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 2
            view.backgroundColor = UIColor.init(hex: "#DCDCDC")
            return view
        }()
        let slideUpViewHeight: CGFloat = UIScreen.main.bounds.size.height * 0.35
        let imageView = ShapesImageView(image: UIImage.init(systemName: "checkmark.circle")!)
        lazy var correctLabel = ShapesLabel(text: "Correct", textAlignment: .center, fontSize: 20, weight: .bold)
        let continueBtn = ShapesButton(backgroundColor: UIColor.systemGreen, title: "Continue")
        weak var delegate: SlideUpVCProtocol?

        override func viewDidLoad() {
            super.viewDidLoad()
            configureSlideUp()
            continueBtn.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        }
    init(isCorrect: Bool) {
            super.init(nibName: nil, bundle: nil)
            imageView.tintColor = isCorrect ? .systemGreen : .red
            imageView.image = isCorrect ? UIImage.init(systemName: "checkmark.circle")! : UIImage.init(systemName: "xmark.circle")!
            correctLabel.textColor = isCorrect ? .systemGreen : .red
            correctLabel.text = isCorrect ? "Correct" : "Incorrect"
            continueBtn.backgroundColor = isCorrect ? .systemGreen : .red
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureSlideUp() {
            view.layer.cornerRadius = 20
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            view.backgroundColor = UIColor.systemBackground
            addSubview()
            setConstraints()
        }
    @objc func continueTapped() {
            dismiss(animated: true)
            delegate?.continueTapped()
        }
        
        private func addSubview() {
            view.addSubview(topLine)
            view.addSubview(imageView)
            view.addSubview(correctLabel)
            view.addSubview(continueBtn)
        }
        
        private func setConstraints() {
            topLine.snp.makeConstraints { make in
                make.top.equalTo(view).offset(15)
                make.height.equalTo(5)
                make.width.equalTo(40)
                make.centerX.equalTo(view)
            }
            
            imageView.snp.makeConstraints { make in
                make.top.equalTo(topLine.snp.bottom).offset(20)
                make.height.equalTo(myScreen.height / 9.5)
                make.width.equalTo(myScreen.height / 9.5)
                make.centerX.equalTo(view)
            }
            
            correctLabel.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(15)
                make.height.equalTo(20)
                make.leading.equalTo(view.snp.leading)
                make.trailing.equalTo(view.snp.trailing)
            }
            
            continueBtn.snp.makeConstraints { make in
                make.top.equalTo(correctLabel.snp.bottom).offset(20)
                make.leading.equalTo(view).offset(20)
                make.trailing.equalTo(view).offset(-20)
                make.height.equalTo(50)
            }
        }


}
