//
//  FirstPersonalizationController.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

final class FirstPersonalizationController: UIViewController {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Personalized Feed"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy private var progressView = ProgressView(step: 1)
    
    lazy private var searchBar = SearchBar(text: "Cuisine Type:")
    
    let objects: [Category] = [Category(title: "Chinese", isUserFave: false), Category(title: "Mexican", isUserFave: true), Category(title: "Japanese", isUserFave: true), Category(title: "French", isUserFave: false), Category(title: "Thai", isUserFave: true), Category(title: "American", isUserFave: false), Category(title: "Greek", isUserFave: false), Category(title: "Mediterranean", isUserFave: true)]
    lazy private var buttonCollection = PopularTable(objects: objects)
    
    lazy private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "LightGrey")?.cgColor
        button.setTitleColor(UIColor(named: "LightGrey"), for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        [label, progressView, searchBar, buttonCollection, nextButton, skipButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 44),
            
            progressView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 34),
            
            searchBar.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 24),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 80),

            buttonCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            buttonCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonCollection.heightAnchor.constraint(equalToConstant: 400),
            
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 46),
            nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -12),
            
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            skipButton.heightAnchor.constraint(equalToConstant: 46),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    @objc private func nextButtonTapped() {
        
    }
    
    @objc private func skipButtonTapped() {
        
    }
}
