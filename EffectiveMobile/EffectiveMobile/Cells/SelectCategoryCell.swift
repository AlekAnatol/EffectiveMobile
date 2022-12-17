//
//  SelectCategoryCell.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 13.12.2022.
//

import UIKit

final class SelectCategoryCell: UICollectionViewCell {
    
    // MARK: - Visual Components
    let categoryView = UIView()
    var categoryImage = UIImageView()
    let categoryLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func setUpCell() {
        categoryImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 30))
        
        contentView.addSubview(categoryView)
        contentView.addSubview(categoryLabel)
        categoryView.addSubview(categoryImage)
        
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        
        categoryView.clipsToBounds = true
        categoryView.layer.cornerRadius = 35
        categoryView.backgroundColor = .white
        
        categoryLabel.font = UIFont(name: "MarkPro-Medium", size: 12)
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            categoryView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 71),
            
            categoryImage.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
            categoryImage.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 7),
            categoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

