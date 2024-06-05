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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [label].forEach {
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
            
        ])
    }
}
