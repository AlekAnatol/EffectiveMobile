//
//  BestSellerCell.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 17.12.2022.
//

import UIKit

final class BestSellerCell: UICollectionViewCell {
    
    // MARK: - Properties
    weak var delegate: BestSellerCellDelegate?
    
    // MARK: - Visual Components
    var modelView = UIImageView()
    let discountPriceLabel = UILabel()
    let priceWithoutDiscountLabel = UILabel()
    let titleLabel = UILabel()
    let isFavoriteButton = UIButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Actions
    @objc private func isFavoriteButtonPressed(sender: UIButton) {
        print("isFavoriteButtonPressed")
      }
    
    // MARK: - Private Methods
    private func setUpCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
 
        contentView.addSubview(modelView)
        contentView.addSubview(discountPriceLabel)
        contentView.addSubview(priceWithoutDiscountLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(isFavoriteButton)
        
        modelView.translatesAutoresizingMaskIntoConstraints = false
        discountPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceWithoutDiscountLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        isFavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        discountPriceLabel.font = UIFont(name: "MarkPro-Bold", size: 16)
        discountPriceLabel.textAlignment = .left
        discountPriceLabel.textColor = .black
        discountPriceLabel.text = "$ 1,030"
        
        priceWithoutDiscountLabel.font = UIFont(name: "MarkPro-Medium", size: 10)
        priceWithoutDiscountLabel.textAlignment = .left
        priceWithoutDiscountLabel.textColor = .lightGray
        priceWithoutDiscountLabel.attributedText = NSAttributedString(string: "$ 930", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        titleLabel.font = UIFont(name: "MarkPro-Regular", size: 10)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        
        isFavoriteButton.layer.cornerRadius = 13
        isFavoriteButton.backgroundColor = .white
        isFavoriteButton.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate), for: .normal)
        isFavoriteButton.tintColor = .brandOrange
        isFavoriteButton.addTarget(self, action: #selector(isFavoriteButtonPressed), for: .touchDown)
        
        NSLayoutConstraint.activate([
            modelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            modelView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            modelView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            modelView.heightAnchor.constraint(equalToConstant: 168),

            discountPriceLabel.topAnchor.constraint(equalTo: modelView.bottomAnchor),
            discountPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            discountPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            priceWithoutDiscountLabel.topAnchor.constraint(equalTo: modelView.bottomAnchor),
            priceWithoutDiscountLabel.leftAnchor.constraint(equalTo: discountPriceLabel.rightAnchor, constant: 7),
            priceWithoutDiscountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: discountPriceLabel.bottomAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            isFavoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            isFavoriteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            isFavoriteButton.heightAnchor.constraint(equalToConstant: 25),
            isFavoriteButton.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}
