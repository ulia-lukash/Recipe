//
//  ProgressView.swift
//  Recipe
//
//  Created by Uliana Lukash on 08.06.2024.
//

import Foundation
import UIKit

final class ProgressView: UIView {
    
    private var stepNum: Int?
    var step: Int {
        get {
            return self.stepNum ?? 0
        }
        set(newStep) {
            
            stepNum = newStep
            switch newStep {
            case 1:
                circle1.backgroundColor = .primary
                cuisineLabel.textColor = .primary
                
                separator1.backgroundColor = .grey
                
                circle2.backgroundColor = .grey
                dietaryLabel.textColor = .grey
                
                separator2.backgroundColor = .grey
                
                circle3.backgroundColor = .grey
                ingredientLabel.textColor = .grey
            case 2:
                circle1.backgroundColor = .primary
                cuisineLabel.textColor = .primary
                
                separator1.backgroundColor = .primary
                
                circle2.backgroundColor = .primary
                dietaryLabel.textColor = .primary
                
                separator2.backgroundColor = .grey
                
                circle3.backgroundColor = .grey
                ingredientLabel.textColor = .grey
            case 3:
                circle1.backgroundColor = .green1
                cuisineLabel.textColor = .green1
                
                separator1.backgroundColor = .green1
                
                circle2.backgroundColor = .green1
                dietaryLabel.textColor = .green1
                
                separator2.backgroundColor = .green1
                
                circle3.backgroundColor = .green1
                ingredientLabel.textColor = .green1
            default:
                break
                
            }
        }
    }
    
    lazy private var circle1: UIView = {
        let view = UIView()
        view.backgroundColor = .primary
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy private var circle2: UIView = {
        let view = UIView()
        view.backgroundColor = .grey
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy private var circle3: UIView = {
        let view = UIView()
        view.backgroundColor = .grey
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy private var separator1: UIView = {
        let view = UIView()
        view.backgroundColor = .grey
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy private var separator2: UIView = {
        let view = UIView()
        view.backgroundColor = .grey
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy private var cuisineLabel: UILabel = {
        let label = UILabel()
        label.text = "Cuisine"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.textColor = .primary
        return label
    }()
    
    lazy private var dietaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Dietary"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.textColor = .grey
        return label
    }()
    
    lazy private var ingredientLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredient"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.textColor = .grey
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init (step: Int) {
        super.init(frame: .zero)
        setUp()
        self.step = step
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [circle1, circle2, circle3, separator1, separator2, cuisineLabel, dietaryLabel, ingredientLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            circle2.topAnchor.constraint(equalTo: topAnchor),
            circle2.heightAnchor.constraint(equalToConstant: 10),
            circle2.widthAnchor.constraint(equalToConstant: 10),
            circle2.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            separator1.heightAnchor.constraint(equalToConstant: 2),
            separator1.widthAnchor.constraint(equalToConstant: 64),
            separator1.trailingAnchor.constraint(equalTo: circle2.leadingAnchor, constant: -10),
            separator1.centerYAnchor.constraint(equalTo: circle2.centerYAnchor),
            
            separator2.heightAnchor.constraint(equalToConstant: 2),
            separator2.widthAnchor.constraint(equalToConstant: 64),
            separator2.leadingAnchor.constraint(equalTo: circle2.trailingAnchor, constant: 10),
            separator2.centerYAnchor.constraint(equalTo: circle2.centerYAnchor),
            
            circle1.topAnchor.constraint(equalTo: topAnchor),
            circle1.heightAnchor.constraint(equalToConstant: 10),
            circle1.widthAnchor.constraint(equalToConstant: 10),
            circle1.trailingAnchor.constraint(equalTo: separator1.leadingAnchor, constant: -10),
            
            circle3.topAnchor.constraint(equalTo: topAnchor),
            circle3.heightAnchor.constraint(equalToConstant: 10),
            circle3.widthAnchor.constraint(equalToConstant: 10),
            circle3.leadingAnchor.constraint(equalTo: separator2.trailingAnchor, constant: 10),
            
            cuisineLabel.topAnchor.constraint(equalTo: circle1.bottomAnchor, constant: 2),
            cuisineLabel.heightAnchor.constraint(equalToConstant: 22),
            cuisineLabel.centerXAnchor.constraint(equalTo: circle1.centerXAnchor),
            
            dietaryLabel.topAnchor.constraint(equalTo: circle2.bottomAnchor, constant: 2),
            dietaryLabel.heightAnchor.constraint(equalToConstant: 22),
            dietaryLabel.centerXAnchor.constraint(equalTo: circle2.centerXAnchor),
            
            ingredientLabel.topAnchor.constraint(equalTo: circle3.bottomAnchor, constant: 2),
            ingredientLabel.heightAnchor.constraint(equalToConstant: 22),
            ingredientLabel.centerXAnchor.constraint(equalTo: circle3.centerXAnchor),
        ])
    }
}
