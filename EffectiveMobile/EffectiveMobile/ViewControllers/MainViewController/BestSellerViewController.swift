//
//  BestSellerViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 12.12.2022.
//

import UIKit

final class BestSellerViewController: UIViewController {

    // MARK: - Properties
    private let collectionItems = ["Samsung Galaxy s20 Ultra",
                                   "Xiaomi Mi 10 Pro",
                                   "Samsung Note 20 Ultra",
                                   "Motorola One Edge"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func seeMoreButtonPressed() {
        print("seeMoreBestSellerButtonPressed")
    }
    
    // MARK: - Visual components
    private let bestSellerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textAlignment = .left
        label.text = "Best sellers"
        return label
    }()
    
    private var seeMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandBackground
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 15)
        button.setTitle("see more", for: .normal)
        button.setTitleColor(.brandOrange, for: .normal)
        button.setTitleColor(.brandBackground, for: .highlighted)
        button.addTarget(self, action: #selector(seeMoreButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy private var bestSellerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: view.frame.height),                            collectionViewLayout: setUpFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .brandBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: "reuse")
        return collectionView
    }()
}

// MARK: - UICollectionViewDataSource
extension BestSellerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as? BestSellerCell
        else { return UICollectionViewCell() }
        cell.titleLabel.text = collectionItems[indexPath.item]
        cell.modelView.image = UIImage(named: collectionItems[indexPath.item])
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension BestSellerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

//MARK: - BestSellerCellDelegate
extension BestSellerViewController: BestSellerCellDelegate {
    func didTapButton(with title: String) {
        print(title)
    }
}

// MARK: - View setup
extension BestSellerViewController {
    private func setUpView() {
        addSubviews()
        setupConstraints()
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(bestSellerLabel)
        view.addSubview(seeMoreButton)
        view.addSubview(bestSellerCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bestSellerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            bestSellerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            bestSellerLabel.heightAnchor.constraint(equalToConstant: 32),
            bestSellerLabel.widthAnchor.constraint(equalToConstant: 200),
            
            seeMoreButton.bottomAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor),
            seeMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 19),
            seeMoreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 317),
            
            bestSellerCollectionView.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor),
            bestSellerCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bestSellerCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bestSellerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width - 30)/2, height: 227)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        return layout
    }
}

//MARK: - Protocol BestSellerCellDelegate
protocol BestSellerCellDelegate: AnyObject {
    func didTapButton(with title: String)
}
