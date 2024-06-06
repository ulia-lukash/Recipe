//
//  BottomView.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

protocol BottomViewDelegate {
    func presentViewController(_ viewController: UIViewController)
}
final class BottomView: UIView {
    
    var delegate: BottomViewDelegate?
    private var buttonType: ButtonType?
    private var linkType: LinkType?
    
    lazy private var button: UIButton = {
        let button = UIButton()
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
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [button, leftSeparator, orLabel, rightSeparator, linkLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 46),
            
            leftSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            leftSeparator.heightAnchor.constraint(equalToConstant: 1),
            leftSeparator.widthAnchor.constraint(equalToConstant: 137),
            leftSeparator.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            orLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 22),
            orLabel.heightAnchor.constraint(equalToConstant: 22),
            orLabel.leadingAnchor.constraint(equalTo: leftSeparator.trailingAnchor),
            orLabel.trailingAnchor.constraint(equalTo: rightSeparator.leadingAnchor),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            rightSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            rightSeparator.widthAnchor.constraint(equalToConstant: 137),
            rightSeparator.heightAnchor.constraint(equalToConstant: 1),
            rightSeparator.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            linkLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 12),
            linkLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            linkLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setButton(buttonText: String, buttonType: ButtonType) {
        button.setTitle(buttonText, for: .normal)
        self.buttonType = buttonType
    }
    
    func setLabel(labelText: String, linkType: LinkType) {
        self.linkType = linkType
        let text = labelText
        linkLabel.text = text
        
        let underlineAttriString = NSMutableAttributedString(string: text)
        var range1: NSRange
        switch linkType {
        case .login:
            range1 = (text as NSString).range(of: "Login")
        case .register:
            range1 = (text as NSString).range(of: "Register")
        }
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Primary")!, range: range1)
        linkLabel.attributedText = underlineAttriString
    }
    
    @objc private func getStartedButtonTapped() {
        switch buttonType {
        case .login:
            let viewController = LoginViewController()
            viewController.modalPresentationStyle = .fullScreen
            delegate?.presentViewController(viewController)
        case .register:
            let viewController = RegisterViewController()
            viewController.modalPresentationStyle = .fullScreen
            delegate?.presentViewController(viewController)
        case .getStarted:
            let viewController = OnboardingViewController()
            viewController.modalPresentationStyle = .fullScreen
            delegate?.presentViewController(viewController)
        default:
            break
        }
    }
    
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        
        switch linkType {
        case .login:
            let text = "Already have an account? Login"
            let loginRange = (text as NSString).range(of: "Login")


            if gesture.didTapAttributedTextInLabel(label: linkLabel, inRange: loginRange) {
                let viewController = LoginViewController()
                viewController.modalPresentationStyle = .fullScreen
                delegate?.presentViewController(viewController)
            }
        case .register:
            let text = "Don’t have an account? Register"
            let loginRange = (text as NSString).range(of: "Register")


            if gesture.didTapAttributedTextInLabel(label: linkLabel, inRange: loginRange) {
                let viewController = RegisterViewController()
                viewController.modalPresentationStyle = .fullScreen
                delegate?.presentViewController(viewController)
            }
        default:
            break
        }
        
        
    }
}

enum ButtonType {
    case login
    case register
    case getStarted
}

enum LinkType {
    case login
    case register
}
