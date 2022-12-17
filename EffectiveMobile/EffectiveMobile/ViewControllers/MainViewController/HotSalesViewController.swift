//
//  HotSalesViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 08.12.2022.
//

import UIKit

final class HotSalesViewController: UIViewController {
    
    // MARK: - Properties
    private let collectionItems = ["Iphone 12", "Samsung Galaxy A71", "Xiaomi Mi 11 ultra"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func seeMoreButtonPressed() {
        print("seeMoreHotSalesButtonPressed")
    }
    
    // MARK: - Visual components
    private let hotSalesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textAlignment = .left
        label.text = "Hot sales"
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
    
    lazy private var hotSalesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: 200),                            collectionViewLayout: setUpFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .brandBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: "reuse")
        return collectionView
    }()
}

// MARK: - UICollectionViewDataSource
extension HotSalesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as? HotSalesCell
        else { return UICollectionViewCell() }
        cell.titleLabel.text = collectionItems[indexPath.item]
        cell.modelView.image = UIImage(named: collectionItems[indexPath.item])
        cell.delegate = self
        return cell
    }
}
 
// MARK: - UICollectionViewDelegate
extension HotSalesViewController: UICollectionViewDelegate {
    
}

// MARK: - HotSalesCellDelegate
extension HotSalesViewController: HotSalesCellDelegate {
    func didTapButton(with title: String) {
        print(title)
    }
}

// MARK: - View setup
extension HotSalesViewController {
    private func setUpView() {
        addSubviews()
        setupConstraints()
        
        hotSalesCollectionView.dataSource = self
        hotSalesCollectionView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(hotSalesLabel)
        view.addSubview(seeMoreButton)
        view.addSubview(hotSalesCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hotSalesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            hotSalesLabel.topAnchor.constraint(equalTo: view.topAnchor),
            hotSalesLabel.heightAnchor.constraint(equalToConstant: 32),
            hotSalesLabel.widthAnchor.constraint(equalToConstant: 200),
            
            seeMoreButton.bottomAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor),
            seeMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 19),
            seeMoreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 317),
            
            hotSalesCollectionView.topAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor),
            hotSalesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hotSalesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hotSalesCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        return layout
    }
}

// MARK: - Protocol HotSalesCellDelegate
protocol HotSalesCellDelegate: AnyObject {
    func didTapButton(with title: String)
}


