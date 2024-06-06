//
//  RegisterViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

final class RegisterViewController: UIViewController {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Register your account"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy private var bottomView: BottomView = {
        let view = BottomView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.delegate = self
        view.setButton(buttonText: "Register", buttonType: .register)
        view.setLabel(labelText: "Already have an account? Login", linkType: .login)
        return view
    }()
    
    lazy private var formView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        return view
    }()
    
    lazy private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy private var nameField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Enter your full name"
        field.font = .systemFont(ofSize: 12, weight: .semibold)
        return field
    }()
    
    lazy private var emailField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Enter your email"
        field.font = .systemFont(ofSize: 12, weight: .semibold)
        return field
    }()
    
    lazy private var passwordField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Password"
        field.font = .systemFont(ofSize: 12, weight: .semibold)
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy private var privacyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        let text = "By registering, you agree with our\nTerms & Conditions and Privacy Policy"
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Terms & Conditions")
        let range2 = (text as NSString).range(of: "Privacy Policy")
        
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Primary")!, range: range1)
        
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Primary")!, range: range2)
        
        label.attributedText = underlineAttriString
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
        setUp()
    }
    
    private func setUp() {
        [label, bottomView, formView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [nameLabel, nameField, emailLabel, emailField, passwordLabel, passwordField, privacyLabel].forEach {
            formView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 94),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 70),
            
            formView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            formView.heightAnchor.constraint(equalToConstant: 404),
            
            nameLabel.topAnchor.constraint(equalTo: formView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameField.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            nameField.heightAnchor.constraint(equalToConstant: 54),
            nameField.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -24),
            
            emailLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            emailLabel.heightAnchor.constraint(equalToConstant: 22),
            
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailField.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            emailField.heightAnchor.constraint(equalToConstant: 54),
            emailField.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -24),
            
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            passwordLabel.heightAnchor.constraint(equalToConstant: 22),
            
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordField.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            passwordField.heightAnchor.constraint(equalToConstant: 54),
            passwordField.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -24),

            privacyLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            privacyLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            privacyLabel.heightAnchor.constraint(equalToConstant: 44),
            privacyLabel.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -24),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        
        let text = "By registering, you agree with our\nTerms & Conditions and Privacy Policy"
        let termsRange = (text as NSString).range(of: "Terms & Conditions")
        let privacyRange = (text as NSString).range(of: "Privacy Policy")

        if gesture.didTapAttributedTextInLabel(label: privacyLabel, inRange: termsRange) {
//           Segue to viewController
        }
        if gesture.didTapAttributedTextInLabel(label: privacyLabel, inRange: privacyRange) {
//           Segue to viewController
        }
        
    }
}

extension RegisterViewController: BottomViewDelegate {
    func presentViewController(_ viewController: UIViewController) {
        let navigationControllerr = UINavigationController(rootViewController: viewController)
        navigationControllerr.modalPresentationStyle = .fullScreen
        self.present(navigationControllerr, animated: true)
    }
}
