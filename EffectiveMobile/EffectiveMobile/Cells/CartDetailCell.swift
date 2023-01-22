//
//  CartDetailCell.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 19.01.2023.
//

import UIKit

class CartDetailCell: UICollectionViewCell {
    
    // MARK: - Properties
    static var reuseIdentifier = "CartDetailCell"
    
    // MARK: - Visual Components
    var modelView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let increaseDecreaseView = IncreaseDecreaseView(frame: CGRect(x: 346, y: 21, width: 0, height: 0))
    let trashButton = UIButton()
    
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
        self.backgroundColor = .brandDarkBlue
        contentView.clipsToBounds = true
 
        contentView.addSubview(modelView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(increaseDecreaseView)
        contentView.addSubview(trashButton)
        
        modelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        trashButton.translatesAutoresizingMaskIntoConstraints = false
        
        modelView.clipsToBounds = true
        modelView.layer.cornerRadius = 10
        
        titleLabel.font = UIFont(name: "MarkPro-Medium", size: 20)
        titleLabel.textAlignment = .left
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.text = "Galalxy Note 20 Ultra"
        
        priceLabel.font = UIFont(name: "MarkPro-Medium", size: 20)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .brandOrange
        priceLabel.text = "$ 3300.00"
        
        trashButton.setImage(UIImage(named: "trash")?.withRenderingMode(.alwaysTemplate), for: .normal)
        trashButton.tintColor = UIColor(red: 0.213, green: 0.211, blue: 0.3, alpha: 1)
        trashButton.addTarget(self, action: #selector(trashButtonPressed), for: .touchDown)
        
        NSLayoutConstraint.activate([
            modelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            modelView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 23),
            modelView.widthAnchor.constraint(equalToConstant: 89),
            modelView.heightAnchor.constraint(equalToConstant: 89),

            titleLabel.topAnchor.constraint(equalTo: modelView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: modelView.rightAnchor, constant: 14),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            priceLabel.bottomAnchor.constraint(equalTo: modelView.bottomAnchor),
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 25),
           
            trashButton.centerYAnchor.constraint(equalTo: modelView.centerYAnchor),
            trashButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25)
        ])
    }
    
    @objc private func trashButtonPressed() {
        print("trashButtonPressed")
    }
}


