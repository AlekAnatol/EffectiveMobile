//
//  HotSalesCell.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 17.12.2022.
//

import UIKit

final class HotSalesCell: UICollectionViewCell {
    
    // MARK: - Properties
    weak var delegate: HotSalesCellDelegate?
    var title: String = ""
    
    // MARK: - Visual Components
    var modelView = UIImageView()
    let isNewLabel = UILabel(frame: CGRect(x: 32, y: 23, width: 27, height: 27))
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let buyNowButton = UIButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc private func buyNowButtonPressed() {
        print("buyNowButtonPressed")
    }
    
    // MARK: - Private Methods
    private func setUpCell() {
        modelView = UIImageView()
        
        contentView.addSubview(modelView)
        modelView.addSubview(isNewLabel)
        modelView.addSubview(titleLabel)
        modelView.addSubview(subtitleLabel)
        contentView.addSubview(buyNowButton)
        
        modelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        buyNowButton.translatesAutoresizingMaskIntoConstraints = false
        
        modelView.clipsToBounds = true
        modelView.layer.cornerRadius = 15
        
        isNewLabel.font = UIFont(name: "MarkPro-Bold", size: 10)
        isNewLabel.layer.cornerRadius = 13
        isNewLabel.clipsToBounds = true
        isNewLabel.backgroundColor = .brandOrange
        isNewLabel.textAlignment = .center
        isNewLabel.textColor = .white
        isNewLabel.text = "New"
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "MarkPro-Bold", size: 25)
        
        subtitleLabel.textColor = .white
        subtitleLabel.text = "subtitleLabel"
        subtitleLabel.font = UIFont(name: "MarkPro-Regular", size: 11)
        
        buyNowButton.backgroundColor = .brandBackground
        buyNowButton.layer.cornerRadius = 5
        buyNowButton.setTitle("Buy now!", for: .normal)
        buyNowButton.setTitleColor(.black, for: .normal)
        buyNowButton.setTitleColor(.brandBackground, for: .highlighted)
        buyNowButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 11)
        buyNowButton.isEnabled = true
        buyNowButton.isUserInteractionEnabled = true
        buyNowButton.addTarget(self, action: #selector(buyNowButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            modelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            modelView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            modelView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            modelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: isNewLabel.bottomAnchor, constant: 18),
            titleLabel.leftAnchor.constraint(equalTo: isNewLabel.leftAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leftAnchor.constraint(equalTo: isNewLabel.leftAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 13),
            
            buyNowButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 26),
            buyNowButton.leftAnchor.constraint(equalTo: isNewLabel.leftAnchor),
            buyNowButton.heightAnchor.constraint(equalToConstant: 23),
            buyNowButton.widthAnchor.constraint(equalToConstant: 98),
        ])
    }
}
