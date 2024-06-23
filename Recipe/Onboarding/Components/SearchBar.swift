//
//  SearchBar.swift
//  Recipe
//
//  Created by Uliana Lukash on 08.06.2024.
//

import Foundation
import UIKit

final class SearchBar: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .primary
        return label
    }()
    
    // TODO: searchBar to design
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.layer.masksToBounds = true
        bar.layer.cornerRadius = 12
        bar.backgroundColor = .white
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init (text: String) {
        super.init(frame: .zero)
        setUp(label: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(label: String) {
        [self.label, searchBar].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
        self.label.text = label
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 22),
            
            searchBar.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
