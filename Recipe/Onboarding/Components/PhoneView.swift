//
//  PhoneView.swift
//  Recipe
//
//  Created by Uliana Lukash on 06.06.2024.
//

import Foundation
import UIKit

final class PhoneView: UIView {
    
    lazy private var view: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 28
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Grey")?.cgColor
        return view
    }()
    
    lazy private var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "9:41"
        label.textColor = UIColor(named: "DarkGrey")
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy private var batteryView: UIImageView = {
        let image = UIImage(systemName: "battery.75percent")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(named: "DarkGrey")
        return imageView
    }()
    
    lazy private var wifiView: UIImageView = {
        let image = UIImage(systemName: "wifi")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(named: "DarkGrey")
        return imageView
    }()
    
    lazy private var cellularView: UIImageView = {
        let image = UIImage(systemName: "cellularbars")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(named: "DarkGrey")
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
        [view, borderView, timeLabel, batteryView, wifiView, cellularView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            view.heightAnchor.constraint(equalToConstant: 430),
            
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 18),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            timeLabel.heightAnchor.constraint(equalToConstant: 22),
            
            batteryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            batteryView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            wifiView.trailingAnchor.constraint(equalTo: batteryView.leadingAnchor, constant: -7),
            wifiView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            cellularView.trailingAnchor.constraint(equalTo: wifiView.leadingAnchor, constant: -7),
            cellularView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            borderView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
}
