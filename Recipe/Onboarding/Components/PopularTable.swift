//
//  PopularTable.swift
//  Recipe
//
//  Created by Uliana Lukash on 08.06.2024.
//

import Foundation
import UIKit

final class PopularTable: UIView {
    
    private var objects: [Category]?
    
//    ["Chinese", "Mexican", "Japanese", "Thai", "French", "American", "Greek", "Mditerranean"]
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Most Popular"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CollectionCell.self)
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init (objects: [Category]) {
        super.init(frame: .zero)
        self.objects = objects
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [label, collection].forEach {
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
            
            collection.topAnchor.constraint(equalTo: label.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension PopularTable: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        objects?.count ?? 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath) as CollectionCell
        let title = objects?[indexPath.item].title.uppercased() ?? "BlahBlah".uppercased()
        let isActive = objects?[indexPath.item].isUserFave ?? false
        cell.setCell(title: title, isPicked: isActive)
        return cell
    }
    
}

extension PopularTable: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Each button should have a fixed width and height
        // Calculate the width of each button based on the screen width and the specified margins and spacing
        let totalSpacing: CGFloat = 16 + 16 + 24 // Left margin + Right margin + Space between two buttons
        let buttonWidth = (collectionView.bounds.width - totalSpacing) / 2
        return CGSize(width: buttonWidth, height: 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Space between two buttons in the same section (between columns)
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Space between rows in the same section
        return 12 // This can be adjusted as needed to vertically center the buttons within the section
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Margins for the entire section
        return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16) // Top and bottom insets are to vertically center the buttons
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // If you need a header for the section, otherwise return CGSize.zero
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // If you need a footer for the section, otherwise return CGSize.zero
        return CGSize.zero
    }
}
