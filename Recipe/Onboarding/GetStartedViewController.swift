//
//  ViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 02.06.2024.
//

import UIKit

final class GetStartedViewController: UIViewController {

//    lazy private var backgroundImage: UIImageView = {
//        let image = UIImage(named: "Backdrop")
//        let imageView = UIImageView(image: image)
//        return imageView
//    }()
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Explore, Cook, Share."
        label.font = .systemFont(ofSize: 64, weight: .bold)
        label.textColor =  UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 4.0
        label.layer.shadowOpacity = 0.25
        label.layer.shadowOffset = CGSize(width: 0, height: 6)
        return label
    }()
    
    lazy private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        view.setLabel(labelText: "", linkType: .login)
        return view
    }()
    
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var leftSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LightGrey")
        return view
    }()
    
    lazy private var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var rightSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LightGrey")
        return view
    }()
    
    lazy private var linkLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        
        let text = "Already have an account? Login"
        label.text = text
        
        let underlineAttriString = NSMutableAttributedString(string: text)
        var range1 = (text as NSString).range(of: "Login")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Primary")!, range: range1)
        label.attributedText = underlineAttriString
        return label
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = UIColor(named: "Primary")
        [label, bottomView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [button, leftSeparator, orLabel, rightSeparator, linkLabel].forEach {
            bottomView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 233),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            label.heightAnchor.constraint(equalToConstant: 234),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 46),
            
            leftSeparator.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            leftSeparator.heightAnchor.constraint(equalToConstant: 1),
            leftSeparator.widthAnchor.constraint(equalToConstant: 137),
            leftSeparator.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            orLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 22),
            orLabel.heightAnchor.constraint(equalToConstant: 22),
            orLabel.leadingAnchor.constraint(equalTo: leftSeparator.trailingAnchor),
            orLabel.trailingAnchor.constraint(equalTo: rightSeparator.leadingAnchor),
            orLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            rightSeparator.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            rightSeparator.widthAnchor.constraint(equalToConstant: 137),
            rightSeparator.heightAnchor.constraint(equalToConstant: 1),
            rightSeparator.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            linkLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 12),
            linkLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            linkLabel.heightAnchor.constraint(equalToConstant: 22)

        ])
    }
    
    @objc private func getStartedButtonTapped() {
        let viewController = OnboardingViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        let text = "Already have an account? Login"
        let loginRange = (text as NSString).range(of: "Login")

        if gesture.didTapAttributedTextInLabel(label: linkLabel, inRange: loginRange) {
            
            let viewController = LoginViewController()
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }

}


