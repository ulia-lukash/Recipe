//
//  Checkbox.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

final class Checkbox: UIView {
    
    var isChecked = false
    
    lazy private var checkbox: UIImageView = {
        let checkbox = UIImageView()
        checkbox.image = UIImage(systemName: "square")
        checkbox.contentMode = .scaleAspectFit
        checkbox.tintColor = .darkGrey
        return checkbox
    }()
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init (text: String) {
        super.init(frame: .zero)
        createSubViews(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubViews(text: String) {
        label.text = text
        
        [label, checkbox].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.topAnchor.constraint(equalTo: topAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),
            
            label.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    public func toggle() {
        self.isChecked = !isChecked
            
        if !isChecked {
            checkbox.image = UIImage(systemName: "checkmark.square.fill")
            checkbox.tintColor = .primary
        } else {
            checkbox.image = UIImage(systemName: "square")
            checkbox.tintColor = .darkGrey
        }
    }
}
