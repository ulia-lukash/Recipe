//
//  BasicCell.swift
//  Recipe
//
//  Created by Uliana Lukash on 12.06.2024.
//

import Foundation
import UIKit

// MARK: - Custom Cell Class
class CollectionCell: UICollectionViewCell, ReuseIdentifying {
    
//    static let identifier = "CustomCell"
    private var isPicked: Bool = false
    let label: UILabel = {
        let label = UILabel()
        label.text = "Custom Cell"
        label.textColor = .white
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCellLayout() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setCell(title: String) {
        button.setTitle(title, for: .normal)
//        self.isPicked = isPicked
//        isPicked ? makeButtonActive() : makeButtonNotActive()
    }
    
    private func makeButtonActive() {
        button.backgroundColor = .primary
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0
    }
    
    private func makeButtonNotActive() {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "DarkGrey")?.cgColor
    }
    
    @objc private func buttonPressed() {
        self.isPicked = !self.isPicked
        isPicked ? makeButtonActive() : makeButtonNotActive()
    }
}
