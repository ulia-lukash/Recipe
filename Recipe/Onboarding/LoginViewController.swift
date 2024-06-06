//
//  LoginViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
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
        view.setButton(buttonText: "Login", buttonType: .login)
        view.setLabel(labelText: "Don’t have an account? Register", linkType: .register)
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
    
    private lazy var checkbox: Checkbox = {
        let checkbox = Checkbox(text: "Remember me")
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckboxWithTitle))
        checkbox.addGestureRecognizer(gesture)
        return checkbox
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
        
        [emailLabel, emailField, passwordLabel, passwordField, checkbox].forEach {
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
            formView.heightAnchor.constraint(equalToConstant: 322),
            
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
            
            checkbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            checkbox.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),
            checkbox.widthAnchor.constraint(equalToConstant: 200),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


    @objc private func didTapCheckboxWithTitle() {
        checkbox.toggle()
                
        if checkbox.isChecked == true {
            //your code goes here
        } else {
            //your code goes here
        }
    }
}

extension LoginViewController: BottomViewDelegate {
    func presentViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}
