//
//  IncreasDecreaseView.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 20.01.2023.
//

import UIKit

class IncreaseDecreaseView: UIView {
    
    var count = 3
    
    let increaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.clipsToBounds = true
        button.setImage(UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(increaseButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let decreaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.clipsToBounds = true
        button.setImage(UIImage(named: "minus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(decreaseButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: 26, height: 68))
        //self.layer.cornerRadius = 13
        //self.backgroundColor = .orange
        self.addSubview(increaseButton)
        self.addSubview(decreaseButton)
        self.addSubview(countLabel)
        self.layer.cornerRadius = 13
        countLabel.text = String(count)
        
        NSLayoutConstraint.activate([
            increaseButton.topAnchor.constraint(equalTo: self.topAnchor),
            increaseButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            increaseButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            increaseButton.heightAnchor.constraint(equalToConstant: 21),
            
            countLabel.topAnchor.constraint(equalTo: increaseButton.bottomAnchor),
            countLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            countLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 26),
            
            decreaseButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor),
            decreaseButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            decreaseButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            decreaseButton.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func increaseButtonPressed() {
        count += 1
        countLabel.text = String(count)
    }

    @objc private func decreaseButtonPressed() {
        count > 0 ? (count -= 1) : (count = 0)
        countLabel.text = String(count)
    }
}

