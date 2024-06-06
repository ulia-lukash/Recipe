//
//  FirstOnBView.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class FirstOnBView: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "1. Browse thousands of recipes"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Primary")
        return label
    }()
    
    lazy private var nasiGorengLabel: UILabel = {
        let label = UILabel()
        label.text = "🇮🇩 Nasi Goreng"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "🇮🇹 Pizza"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var cremeBruleeLabel: UILabel = {
        let label = UILabel()
        label.text = "🇫🇷 Crème Brûlée"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var padThaiLabel: UILabel = {
        let label = UILabel()
        label.text = "🇹🇭 Pad Thai"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var sushiLabel: UILabel = {
        let label = UILabel()
        label.text = "🇯🇵 Sushi"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var gulabJamunLabel: UILabel = {
        let label = UILabel()
        label.text = "🇮🇳 Gulab Jamun"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var pastelLabel: UILabel = {
        let label = UILabel()
        label.text = "🇵🇹 Pastel de Nata"
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
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
        [label, nasiGorengLabel, pizzaLabel, cremeBruleeLabel, padThaiLabel, sushiLabel, gulabJamunLabel, pastelLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 22),
            
            nasiGorengLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            nasiGorengLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            nasiGorengLabel.heightAnchor.constraint(equalToConstant: 46),
            nasiGorengLabel.widthAnchor.constraint(equalToConstant: 156),
            
            pizzaLabel.topAnchor.constraint(equalTo: nasiGorengLabel.bottomAnchor, constant: 16),
            pizzaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            pizzaLabel.heightAnchor.constraint(equalToConstant: 46),
            pizzaLabel.widthAnchor.constraint(equalToConstant: 97),
            
            cremeBruleeLabel.topAnchor.constraint(equalTo: pizzaLabel.bottomAnchor, constant: 16),
            cremeBruleeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            cremeBruleeLabel.heightAnchor.constraint(equalToConstant: 46),
            cremeBruleeLabel.widthAnchor.constraint(equalToConstant: 168),
            
            padThaiLabel.topAnchor.constraint(equalTo: cremeBruleeLabel.bottomAnchor, constant: 16),
            padThaiLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            padThaiLabel.heightAnchor.constraint(equalToConstant: 46),
            padThaiLabel.widthAnchor.constraint(equalToConstant: 126),
            
            sushiLabel.topAnchor.constraint(equalTo: padThaiLabel.bottomAnchor, constant: 16),
            sushiLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            sushiLabel.heightAnchor.constraint(equalToConstant: 46),
            sushiLabel.widthAnchor.constraint(equalToConstant: 99),
            
            gulabJamunLabel.topAnchor.constraint(equalTo: sushiLabel.bottomAnchor, constant: 16),
            gulabJamunLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            gulabJamunLabel.heightAnchor.constraint(equalToConstant: 46),
            gulabJamunLabel.widthAnchor.constraint(equalToConstant: 164),
            
            pastelLabel.topAnchor.constraint(equalTo: gulabJamunLabel.bottomAnchor, constant: 16),
            pastelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            pastelLabel.heightAnchor.constraint(equalToConstant: 46),
            pastelLabel.widthAnchor.constraint(equalToConstant: 174),
        ])
    }
}
