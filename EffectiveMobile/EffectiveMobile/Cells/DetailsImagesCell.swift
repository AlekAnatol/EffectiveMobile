//
//  DetailsImagesCell.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 16.12.2022.
//

import UIKit

final class DetailsImagesCell: UICollectionViewCell {
    
    // MARK: - Properties
    static var reuseIdentifier = "DetailsImagesCell"
    
    // MARK: - Visual Components
    var modelView = UIImageView()
    
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
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.layer.shadowColor = UIColor(red: 0.298, green: 0.372, blue: 0.562, alpha: 0.1).cgColor
        modelView = UIImageView()
        contentView.addSubview(modelView)
        modelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            modelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            modelView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            modelView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
}
