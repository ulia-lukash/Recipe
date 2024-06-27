//
//  ThirdPersonalizationController.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation
import UIKit

final class ThirdPersonalizationController: UIViewController {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Personalized Feed"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy private var progressView = ProgressView(step: 3)
    
    lazy private var searchBar = SearchBar(text: "Favorite Ingredient:")
    
    let objects: [Category] = []
    lazy private var buttonCollection = PopularTable(objects: objects)
    
    lazy private var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start Recipe Exploring!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        [label, progressView, searchBar, buttonCollection, startButton].forEach {
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
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.heightAnchor.constraint(equalToConstant: 46),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    @objc private func startButtonTapped() {
        let viewController = TabBarController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}
