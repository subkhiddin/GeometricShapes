//
//  TakeQuizViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit

class TakeQuizViewController: UIViewController {
    
    lazy var questionInfoLabel = ShapesLabel(text: "", textAlignment: .center, fontSize: 20, weight: .medium)
        lazy var button1 = ShapesButton(backgroundColor: UIColor.init(hex: "F92968"), title: "1")
        lazy var button2 = ShapesButton(backgroundColor: UIColor.init(hex: "F92968"), title: "2")
        lazy var button3 = ShapesButton(backgroundColor: UIColor.init(hex: "F92968"), title: "3")
        lazy var button4 = ShapesButton(backgroundColor: UIColor.init(hex: "F92968"), title: "3")
        lazy var buttons: [ShapesButton] = [button1, button2, button3, button4]
        lazy var questionLabel = ShapesLabel(text: "Question number: \(count < 20 ? count + 1 : count)", textAlignment: .center, fontSize: 20, weight: .medium)
        lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.init(hex: "000000").withAlphaComponent(0.1)
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            return view
        }()
        
        var items = shapes
        var resultItems = [Shapes]()
        var correctIndex = 0
        var score = 0
        var count = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
      
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            generate()
        }
     
        private func configureUI() {
            addSubviews()
            setConstraints()
            addTargets()
            view.backgroundColor = UIColor.systemBackground
            self.navigationItem.titleView = twoLineTitleView(text: "Score: \(score)")
            navigationController?.navigationBar.tintColor = UIColor.label
        }
        
        private func addTargets() {
            buttons.forEach { button in
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
        }
    @objc func buttonTapped(_ sender: UIButton) {
           let correct = sender.currentTitle == resultItems[correctIndex].name
           if sender.currentTitle == resultItems[correctIndex].name {
               score += 1
           }
           self.navigationItem.titleView = twoLineTitleView(text: "Score: \(score)")
           questionLabel.text = "Question number: \(count < 20 ? count + 1 : count)"
           let slide = SlideInPresentationManager()
           let slideUpView = SlideUpViewController(isCorrect: correct)
           slideUpView.delegate = self
           slide.direction = .bottom
           slide.height = slideUpView.slideUpViewHeight
           let vc = UINavigationController(rootViewController: slideUpView)
           vc.transitioningDelegate = slide
           vc.modalPresentationStyle = .custom
           self.present(vc, animated: true, completion: nil)
       }
       
       private func addSubviews() {
           view.addSubview(questionInfoLabel)
           view.addSubview(button1)
           view.addSubview(button2)
           view.addSubview(button3)
           view.addSubview(button4)
           view.addSubview(backgroundView)
           view.addSubview(questionLabel)
       }
    private func setConstraints() {
            backgroundView.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top).offset(myScreen.height / 6)
                make.leading.equalTo(view).offset(25)
                make.trailing.equalTo(view).offset(-25)
                make.height.equalTo(UIScreen.main.bounds.width - 40 * 2)
            }
            
            questionInfoLabel.snp.makeConstraints { make in
                make.leading.equalTo(backgroundView.snp.leading).offset(20)
                make.trailing.equalTo(backgroundView.snp.trailing).offset(-20)
                make.top.equalTo(backgroundView.snp.top).offset(20)
                make.bottom.equalTo(backgroundView.snp.bottom).offset(-20)
            }
            
            button1.snp.makeConstraints { make in
                make.leading.equalTo(view).offset(20)
                make.trailing.equalTo(view.snp.centerX).offset(-10)
                make.height.equalTo(50)
                make.top.equalTo(questionInfoLabel.snp.bottom).offset(60)
            }
            
            button2.snp.makeConstraints { make in
                make.trailing.equalTo(view).offset(-20)
                make.leading.equalTo(view.snp.centerX).offset(10)
                make.height.equalTo(50)
                make.top.equalTo(questionInfoLabel.snp.bottom).offset(60)
            }
          button3.snp.makeConstraints { make in
                   make.leading.equalTo(view).offset(20)
                   make.trailing.equalTo(view.snp.centerX).offset(-10)
                   make.height.equalTo(50)
                   make.top.equalTo(button1.snp.bottom).offset(20)
               }
               
               button4.snp.makeConstraints { make in
                   make.trailing.equalTo(view).offset(-20)
                   make.leading.equalTo(view.snp.centerX).offset(10)
                   make.height.equalTo(50)
                   make.top.equalTo(button2.snp.bottom).offset(20)
               }
               
               questionLabel.snp.makeConstraints { make in
                   make.trailing.equalTo(view).offset(-20)
                   make.leading.equalTo(view).offset(10)
                   make.height.equalTo(25)
                   make.top.equalTo(button4.snp.bottom).offset(40)
               }
           }
    func generate() {
            count += 1
            if count > 10 {
                presentAlertOnMainThread(title: score > 8 ? "Well Done" : (score > 6 ? "Practice More" : (score > 4 ? "Poor Preformance" : "Failure")), message: "You have answered \(score)  questions correctly.", buttonTitle: "OK")
                navigationController?.popViewController(animated: true)
                return
            }
            
            items.shuffle()
            resultItems = []
            
            for i in 0...3 {
                resultItems.append(items[i])
            }
            
            button1.setTitle(resultItems[0].name, for: .normal)
            button2.setTitle(resultItems[1].name, for: .normal)
            button3.setTitle(resultItems[2].name, for: .normal)
            button4.setTitle(resultItems[3].name, for: .normal)
            
            correctIndex = Int.random(in: 0...3)
            questionInfoLabel.text = resultItems[correctIndex].quiz
        }
}
extension TakeQuizViewController: SlideUpVCProtocol {
    func continueTapped() {
        generate()
    }
    
}
