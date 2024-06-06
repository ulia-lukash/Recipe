//
//  ThirdOnBView.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class ThirdOnBView: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "3. Save your favorite recipes"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Primary")
        return label
    }()
    
    lazy private var view = PhoneView()
    
    lazy private var imageView: UIImageView = {
        let image = UIImage(named: "Noodles")
        let imageView = UIImageView(image: image)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    lazy private var markButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        button.tintColor = UIColor(named: "Primary")
        button.backgroundColor = .white
        button.layer.cornerRadius = 21
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy private var padThailabel: UILabel = {
        let label = UILabel()
        label.text = "Pad Thai"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "DarkGrey")
        return label
    }()
    
    lazy private var textField: UILabel = {
        let textField = UILabel()
        textField.textColor = UIColor(named: "DarkGrey")
        textField.font = .systemFont(ofSize: 12, weight: .medium)

        textField.numberOfLines = 0
        textField.lineBreakMode = .byWordWrapping
        
        let stringValue = "Pad Thai is a popular stir-fried noodle dish from Thailand. It typically consists of rice noodles stir-fried with ingredients such as tofu, shrimp, chicken, or beef, along with eggs, bean sprouts, garlic, shallots, peanuts, and various seasonings."
        let attrString = NSMutableAttributedString(string: stringValue)
        var style = NSMutableParagraphStyle()
        style.minimumLineHeight = 22
        attrString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: stringValue.count))
        textField.attributedText = attrString
        return textField
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [label, view, imageView, markButton, padThailabel, textField, gradientView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
        
//        TODO: fix the gradient on textField
        var gradient = CAGradientLayer()
        textField.layoutIfNeeded()

        gradient.startPoint = CGPoint(x: CGFloat(0), y: CGFloat(0.5))
        gradient.endPoint = CGPoint(x: CGFloat(1), y: CGFloat(0.5))
        gradient.frame = textField.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.white.cgColor]

        textField.layer.insertSublayer(gradient, at: 0)
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
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -37),
            
            markButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 12),
            markButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12),
            markButton.widthAnchor.constraint(equalToConstant: 42),
            markButton.heightAnchor.constraint(equalToConstant: 42),
            
            padThailabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            padThailabel.heightAnchor.constraint(equalToConstant: 22),
            padThailabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            
            textField.topAnchor.constraint(equalTo: padThailabel.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -37),
        ])
    }
}
