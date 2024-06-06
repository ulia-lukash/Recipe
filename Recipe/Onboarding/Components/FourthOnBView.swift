//
//  FourthOnBView.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class FourthOnBView: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "4. Share with friends!"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "Primary")
        return label
    }()
    
    lazy private var circle1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Peach")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy private var circle2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Peach")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy private var circle3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Peach")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy private var circle4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Peach")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    lazy private var imageView1: UIImageView = {
        let image = UIImage(named: "instagram")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy private var imageView2: UIImageView = {
        let image = UIImage(named: "facebook")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy private var imageView3: UIImageView = {
        let image = UIImage(named: "pinterest")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy private var imageView4: UIImageView = {
        let image = UIImage(named: "twitter")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [label, circle1, circle2, circle3, circle4, imageView1, imageView2, imageView3, imageView4].forEach {
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
            
            circle1.topAnchor.constraint(equalTo: topAnchor, constant: 78),
            circle1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 58),
            circle1.widthAnchor.constraint(equalToConstant: 120),
            circle1.heightAnchor.constraint(equalToConstant: 120),
            
            circle2.topAnchor.constraint(equalTo: circle1.centerYAnchor),
            circle2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -58),
            circle2.widthAnchor.constraint(equalToConstant: 120),
            circle2.heightAnchor.constraint(equalToConstant: 120),
            
            circle3.topAnchor.constraint(equalTo: circle2.bottomAnchor),
            circle3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 58),
            circle3.widthAnchor.constraint(equalToConstant: 120),
            circle3.heightAnchor.constraint(equalToConstant: 120),
            
            circle4.topAnchor.constraint(equalTo: circle3.centerYAnchor),
            circle4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -58),
            circle4.widthAnchor.constraint(equalToConstant: 120),
            circle4.heightAnchor.constraint(equalToConstant: 120),
            
            imageView1.widthAnchor.constraint(equalToConstant: 70),
            imageView1.heightAnchor.constraint(equalToConstant: 70),
            imageView1.centerXAnchor.constraint(equalTo: circle1.centerXAnchor),
            imageView1.centerYAnchor.constraint(equalTo: circle1.centerYAnchor),
            
            imageView2.widthAnchor.constraint(equalToConstant: 70),
            imageView2.heightAnchor.constraint(equalToConstant: 70),
            imageView2.centerXAnchor.constraint(equalTo: circle2.centerXAnchor),
            imageView2.centerYAnchor.constraint(equalTo: circle2.centerYAnchor),
            
            imageView3.widthAnchor.constraint(equalToConstant: 70),
            imageView3.heightAnchor.constraint(equalToConstant: 70),
            imageView3.centerXAnchor.constraint(equalTo: circle3.centerXAnchor),
            imageView3.centerYAnchor.constraint(equalTo: circle3.centerYAnchor),
            
            imageView4.widthAnchor.constraint(equalToConstant: 70),
            imageView4.heightAnchor.constraint(equalToConstant: 70),
            imageView4.centerXAnchor.constraint(equalTo: circle4.centerXAnchor),
            imageView4.centerYAnchor.constraint(equalTo: circle4.centerYAnchor),
            
        ])
    }
}
