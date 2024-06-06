//
//  SecondOnBView.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class SecondOnBView: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "2. Personalize your feed"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Primary")
        return label
    }()
    
    lazy private var view = PhoneView()
    
    lazy private var indoLabel: UILabel = {
        let label = UILabel()
        label.text = "Indonesian Food"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "DarkGrey")
        return label
    }()
    
    lazy private var easyLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy Dietary Recipe"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "DarkGrey")
        return label
    }()
    
    lazy private var square1 = UIView()
    lazy private var square2 = UIView()
    lazy private var square3 = UIView()
    lazy private var square4 = UIView()
    lazy private var square5 = UIView()
    lazy private var square6 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [label, view, indoLabel, square1, square2, square3, square4, square5, square6, easyLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
        
        [square1, square2, square3, square4, square5, square6].forEach {
            setGradient(to: $0)
        }
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 22),
            
            view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 22),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 430),
            
            indoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
            indoLabel.heightAnchor.constraint(equalToConstant: 22),
            indoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            
            square1.topAnchor.constraint(equalTo: indoLabel.bottomAnchor, constant: 18),
            square1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            square1.heightAnchor.constraint(equalToConstant: 100),
            square1.widthAnchor.constraint(equalToConstant: 100),
            
            square2.topAnchor.constraint(equalTo: indoLabel.bottomAnchor, constant: 18),
            square2.leadingAnchor.constraint(equalTo: square1.trailingAnchor, constant: 16),
            square2.heightAnchor.constraint(equalToConstant: 100),
            square2.widthAnchor.constraint(equalToConstant: 100),
            
            square3.topAnchor.constraint(equalTo: indoLabel.bottomAnchor, constant: 18),
            square3.leadingAnchor.constraint(equalTo: square2.trailingAnchor, constant: 16),
            square3.heightAnchor.constraint(equalToConstant: 100),
            square3.widthAnchor.constraint(equalToConstant: 100),
            
            easyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 248),
            easyLabel.heightAnchor.constraint(equalToConstant: 22),
            easyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            
            square4.topAnchor.constraint(equalTo: easyLabel.bottomAnchor, constant: 18),
            square4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            square4.heightAnchor.constraint(equalToConstant: 100),
            square4.widthAnchor.constraint(equalToConstant: 100),
            
            square5.topAnchor.constraint(equalTo: easyLabel.bottomAnchor, constant: 18),
            square5.leadingAnchor.constraint(equalTo: square4.trailingAnchor, constant: 16),
            square5.heightAnchor.constraint(equalToConstant: 100),
            square5.widthAnchor.constraint(equalToConstant: 100),
            
            square6.topAnchor.constraint(equalTo: easyLabel.bottomAnchor, constant: 18),
            square6.leadingAnchor.constraint(equalTo: square5.trailingAnchor, constant: 16),
            square6.heightAnchor.constraint(equalToConstant: 100),
            square6.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    private func setGradient(to view: UIView) {
        var gradient = CAGradientLayer()
        view.layoutIfNeeded()

        gradient.startPoint = CGPoint(x: CGFloat(0), y: CGFloat(0.5))
        gradient.endPoint = CGPoint(x: CGFloat(1), y: CGFloat(0.5))
            gradient.frame = view.bounds
        gradient.colors = [UIColor(named: "Grey3")!.cgColor, UIColor.white.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
    }
}
