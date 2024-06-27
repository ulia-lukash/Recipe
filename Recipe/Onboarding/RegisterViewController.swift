//
//  RegisterViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

final class RegisterViewController: UIViewController {
    
    let auth = AuthManager()
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Register your account"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
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
        label.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(loginTapped(gesture:))))
        
        let text = "Already have an account? Login"
        label.text = text
        
        let underlineAttriString = NSMutableAttributedString(string: text)
        var range1 = (text as NSString).range(of: "Login")
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "Primary")!, range: range1)
        label.attributedText = underlineAttriString
        return label
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
        [label, formView, bottomView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [emailLabel, emailField, passwordLabel, passwordField, privacyLabel].forEach {
            formView.addSubview($0)
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
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 70),
            label.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -12),
            
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            formView.heightAnchor.constraint(equalToConstant: 322),
            formView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            
            emailLabel.topAnchor.constraint(equalTo: formView.topAnchor, constant: 24),
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
    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
        
    }
    @objc private func loginTapped(gesture: UITapGestureRecognizer) {
        let viewController = LoginViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc private func registerButtonTapped() {
        guard let email = emailField.text, let password = passwordField.text else { return }
        
        auth.registerUser(email: email, password: password) {result,error in
            if let result = result {
                print("Registration successfull")
                self.auth.signInUser(email: email, password: password) {result,error in
                    if let resull = result {
                        print("SignIn successfull")
                    }
                    if let error = error {
                        print("SignIn failed")
                        print(error)
                    }
                }
            }
            if let error = error {
                print("Registration failed")
                print(error)
            }
            
        }
    }
}
