//
//  FilterViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 14.12.2022.
//

import UIKit

final class FilterViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    //MARK: - Actions
    @objc private func crossButtonTaped() {
        self.dismiss(animated: true)
        print("crossButtonTaped")
    }
    
    @objc private func doneButtonTaped() {
     print("doneButtonTaped")
    }
    
    // MARK: - Visual components
    let crossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .brandDarkBlue
        button.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(crossButtonTaped), for: .touchUpInside)
        return button
    }()
    
    let filterOptionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .center
        label.text = "Filter options"
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .brandOrange
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.brandOrange, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "MarkPro-Medium", size: 18)
        button.addTarget(self, action: #selector(doneButtonTaped), for: .touchUpInside)
        return button
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .left
        label.text = "Brand"
        return label
    }()
    
    let chooseBrandButton: DropDownButton = {
        let button = DropDownButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Samsung", for: .normal)
        button.dropView.dropDownOptions = ["Samsung", "Iphone", "Xiaomi", "Motorola"]
        return button
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .left
        label.text = "Price"
        return label
    }()
    
    let choosePriceButton: DropDownButton = {
        let button = DropDownButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("$300 - $500", for: .normal)
        button.dropView.dropDownOptions = ["$300 - $500", "$500 - $1000", "$1000 - $1500"]
        return button
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .left
        label.text = "Size"
        return label
    }()
    
    let chooseSizeButton: DropDownButton = {
        let button = DropDownButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("4.5 to 5.5 inches", for: .normal)
        button.dropView.dropDownOptions = ["4.5 to 5.5 inches", "5.5 to 7.5 inches"]
        return button
    }()
}

// MARK: - View setup
extension FilterViewController {
    private func setUpView() {
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(crossButton)
        view.addSubview(filterOptionsLabel)
        view.addSubview(doneButton)
        view.addSubview(brandLabel)
        view.addSubview(chooseBrandButton)
        view.addSubview(priceLabel)
        view.addSubview(choosePriceButton)
        view.addSubview(sizeLabel)
        view.addSubview(chooseSizeButton)
        
        view.sendSubviewToBack(brandLabel)
        view.sendSubviewToBack(chooseBrandButton)
        view.sendSubviewToBack(priceLabel)
        view.sendSubviewToBack(choosePriceButton)
        view.sendSubviewToBack(sizeLabel)
        view.sendSubviewToBack(chooseSizeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            crossButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            crossButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44),
            crossButton.heightAnchor.constraint(equalToConstant: 37),
            crossButton.widthAnchor.constraint(equalToConstant: 37),
            
            filterOptionsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            filterOptionsLabel.leftAnchor.constraint(equalTo: crossButton.rightAnchor, constant: 65),
            filterOptionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 37),
            doneButton.widthAnchor.constraint(equalToConstant: 86),
            
            brandLabel.topAnchor.constraint(equalTo: crossButton.bottomAnchor, constant: 36),
            brandLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            brandLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46),
            
            chooseBrandButton.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 12),
            chooseBrandButton.leftAnchor.constraint(equalTo: brandLabel.leftAnchor),
            chooseBrandButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31),
            chooseBrandButton.heightAnchor.constraint(equalToConstant: 37),
            
            priceLabel.topAnchor.constraint(equalTo: chooseBrandButton.bottomAnchor, constant: 12),
            priceLabel.rightAnchor.constraint(equalTo: brandLabel.rightAnchor),
            priceLabel.leftAnchor.constraint(equalTo: brandLabel.leftAnchor),
            
            choosePriceButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            choosePriceButton.leftAnchor.constraint(equalTo: brandLabel.leftAnchor),
            choosePriceButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31),
            choosePriceButton.heightAnchor.constraint(equalToConstant: 37),
            
            sizeLabel.topAnchor.constraint(equalTo: choosePriceButton.bottomAnchor, constant: 12),
            sizeLabel.rightAnchor.constraint(equalTo: brandLabel.rightAnchor),
            sizeLabel.leftAnchor.constraint(equalTo: brandLabel.leftAnchor),
            
            chooseSizeButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 12),
            chooseSizeButton.leftAnchor.constraint(equalTo: brandLabel.leftAnchor),
            chooseSizeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31),
            chooseSizeButton.heightAnchor.constraint(equalToConstant: 37),
            
        ])
    }
}

