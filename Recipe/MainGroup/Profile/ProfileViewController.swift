//
//  ProfileViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    lazy private var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        return button
    }()
                         
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp() {
        [signOutButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signOutButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    @objc private func logOutButtonTapped() {
        let auth = AuthManager()
        auth.signOut()
        if (!auth.isLoggedIn()) {
            let viewController = RegisterViewController()
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
