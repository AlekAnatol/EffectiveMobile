//
//  CartViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 19.01.2023.
//

import UIKit

class CartViewController: UIViewController {

    // MARK: - Properties
    let productImages = ["samsung1", "samsung2", "samsung2"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func addAdressButtonTaped() {
        print("addAdressButtonTaped")
    }
    
    @objc private func backOnCartTaped() {
        print("backOnCartTaped")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func checkoutButtonPressed() {
        print("checkoutButtonPressed")
    }
    
    // MARK: - Visual components
    let myCartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Cart"
        label.font = UIFont(name: "MarkPro-Bold", size: 35)
        label.textColor = .brandDarkBlue
        return label
    }()
    
    let cartBlueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brandDarkBlue
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy private var productInCartCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: 0,
                                                            height: 0),                            collectionViewLayout: setUpFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .brandDarkBlue
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CartDetailCell.self, forCellWithReuseIdentifier: CartDetailCell.reuseIdentifier)
        return collectionView
    }()
    
    let firstWhiteLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        return view
    }()
    
    let secondWhiteLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        return view
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        label.text = "Total"
        return label
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        label.text = "Delivery"
        return label
    }()
    
    let totalSumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.text = "$6,000 us"
        return label
    }()
    
    let deliverySumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.text = "Free"
        return label
    }()
    
    let checkoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.brandOrange, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        button.addTarget(self, action: #selector(checkoutButtonPressed), for: .touchUpInside)
        return button
    }()
}

// MARK: - UICollectionViewDataSource
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartDetailCell.reuseIdentifier, for: indexPath) as? CartDetailCell
        else { return UICollectionViewCell() }
        cell.modelView.image = UIImage(named: productImages[indexPath.item])
        cell.increaseDecreaseView.countLabel.text = String(indexPath.item)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CartViewController: UICollectionViewDelegate {
    
}


// MARK: - View setup
extension CartViewController {
    private func setUpView() {
        view.backgroundColor = .brandBackground
        navigationBarSetup()
        addSubviews()
        setupConstraints()
    }
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 110)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        return layout
    }
    
    private func navigationBarSetup() {
        let addAressLabel = UILabel()
        addAressLabel.textColor = UIColor.brandDarkBlue
        addAressLabel.font = UIFont(name: "MarkPro-Medium", size: 15)
        addAressLabel.text = "Add address"
        
        let addAdressButton = UIButton()
        addAdressButton.translatesAutoresizingMaskIntoConstraints = false
        addAdressButton.backgroundColor = .brandOrange
        addAdressButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        addAdressButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        addAdressButton.clipsToBounds = true
        addAdressButton.layer.cornerRadius = 10
        addAdressButton.setImage(UIImage(named: "geopoint")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addAdressButton.tintColor = .white
        addAdressButton.addTarget(self, action: #selector(addAdressButtonTaped), for: .touchUpInside)
        
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .brandDarkBlue
        backButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 10
        backButton.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backOnCartTaped), for: .touchUpInside)
        
        let rightButtonBarItem = UIBarButtonItem(customView: addAdressButton)
        let rightLabelBarItem = UIBarButtonItem(customView: addAressLabel)
        let leftBarItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItems = [rightButtonBarItem, rightLabelBarItem]
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    private func addSubviews() {
        view.addSubview(myCartLabel)
        view.addSubview(cartBlueView)
        view.addSubview(productInCartCollectionView)
        view.addSubview(firstWhiteLine)
        view.addSubview(secondWhiteLine)
        view.addSubview(totalLabel)
        view.addSubview(deliveryLabel)
        view.addSubview(totalSumLabel)
        view.addSubview(deliverySumLabel)
        view.addSubview(checkoutButton)
    }

    private func setupConstraints() {
        productInCartCollectionView.delegate = self
        productInCartCollectionView.dataSource = self
        productInCartCollectionView.register(CartDetailCell.self,
                                        forCellWithReuseIdentifier: CartDetailCell.reuseIdentifier)
        NSLayoutConstraint.activate([
            myCartLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 136),
            myCartLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42),
            myCartLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -42),
            myCartLabel.heightAnchor.constraint(equalToConstant: 44),
           
            cartBlueView.topAnchor.constraint(equalTo: myCartLabel.bottomAnchor, constant: 49),
            cartBlueView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cartBlueView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cartBlueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            productInCartCollectionView.topAnchor.constraint(equalTo: myCartLabel.bottomAnchor, constant: 109),
            productInCartCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            productInCartCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            productInCartCollectionView.heightAnchor.constraint(equalToConstant: 340),
            
            firstWhiteLine.topAnchor.constraint(equalTo: cartBlueView.topAnchor, constant: 462),
            firstWhiteLine.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstWhiteLine.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstWhiteLine.heightAnchor.constraint(equalToConstant: 2),
            
            secondWhiteLine.topAnchor.constraint(equalTo: firstWhiteLine.topAnchor, constant: 91),
            secondWhiteLine.leftAnchor.constraint(equalTo: view.leftAnchor),
            secondWhiteLine.rightAnchor.constraint(equalTo: view.rightAnchor),
            secondWhiteLine.heightAnchor.constraint(equalToConstant: 2),
            
            totalLabel.topAnchor.constraint(equalTo: firstWhiteLine.topAnchor, constant: 15),
            totalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 55),
            totalLabel.widthAnchor.constraint(equalToConstant: 200),
            
            deliveryLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 12),
            deliveryLabel.leftAnchor.constraint(equalTo: totalLabel.leftAnchor),
            deliveryLabel.widthAnchor.constraint(equalToConstant: 200),
            
            totalSumLabel.topAnchor.constraint(equalTo: totalLabel.topAnchor),
            totalSumLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 306),
            totalSumLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            deliverySumLabel.topAnchor.constraint(equalTo: deliveryLabel.topAnchor),
            deliverySumLabel.leftAnchor.constraint(equalTo: totalSumLabel.leftAnchor),
            deliverySumLabel.rightAnchor.constraint(equalTo: totalSumLabel.rightAnchor),
            
            checkoutButton.topAnchor.constraint(equalTo: secondWhiteLine.topAnchor, constant: 27),
            checkoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44),
            checkoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44),
            checkoutButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
