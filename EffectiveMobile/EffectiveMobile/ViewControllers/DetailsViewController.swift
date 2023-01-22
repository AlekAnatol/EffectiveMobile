//
//  DetailsViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 15.12.2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    let productImages = ["samsung1", "samsung2"]
    private var detailButtons = [UIButton]()
    private var colorButtons = [UIButton]()
    private var sdButtons = [UIButton]()
    private var selectedRate: Int = 4
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func myCartOnDetailsTaped() {
        print("myCartOnDetailsTaped")
    }
    
    @objc private func backOnDetailsTaped() {
        print("backOnDetailsTaped")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func isFavoriteButtonPressed() {
        print("isFavoriteButtonPressed")
    }
    
    @objc private func addToCartButtonPressed() {
        print("addToCartButtonPressed")
    }
    
    @objc func descriptionCategoryButtonPressed(_ sender: Any) {
        guard let sender = sender as? UIButton else { return }
        for button in detailButtons {
            unselectedFontSet(button: button)
        }
        selectedFontSet(button: sender)
    }
    
    @objc private func selectColorButtonPressed(sender: UIButton) {
        for button in colorButtons {
            button.tintColor = button.backgroundColor
        }
        sender.tintColor = .white
    }
    
    @objc private func selectSdButtonPressed(sender: UIButton) {
        for button in sdButtons {
            button.backgroundColor = .clear
            button.setTitleColor(.lightGray, for: .normal)
        }
        sender.backgroundColor = .brandOrange
        sender.setTitleColor(.white, for: .normal)
    }
    
    //MARK: - Private Methods
    private func createStars() {
        for index in 1...Constants.starsCount {
            let star = makeStarIcon()
            star.tag = index
            starsContainer.addArrangedSubview(star)
        }
    }
    
    private func makeStarIcon() -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate),
                                    highlightedImage: UIImage(systemName: "star.fill"))
        imageView.tintColor = UIColor(red: 1, green: 0.72, blue: 0, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }
    
    private func selectedFontSet(button: UIButton) {
        guard let title = button.titleLabel?.text else { return }
        button.setTitleColor(.brandDarkBlue, for: .normal)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "MarkPro-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20),
            .underlineColor: UIColor.brandOrange,
            .underlineStyle: NSUnderlineStyle.thick.rawValue
        ]
        let attributeTitle = NSMutableAttributedString(string: title, attributes: titleAttributes)
        button.setAttributedTitle(attributeTitle, for: .normal)
    }
            
    private func unselectedFontSet(button: UIButton) {
        guard let title = button.titleLabel?.text else { return }
        button.setTitleColor(.systemGray, for: .normal)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "MarkPro-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        let attributeTitle = NSMutableAttributedString(string: title, attributes: titleAttributes)
        button.setAttributedTitle(attributeTitle, for: .normal)
    }
    
    // MARK: - Visual components
    lazy private var productImagesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: 0,
                                                            height: 0),                            collectionViewLayout: setUpFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .brandBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: "reuse")
        return collectionView
    }()
    
    let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 24)
        label.text = "Galaxy Note 20 Ultra"
        return label
    }()
    
    let isFavoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .brandDarkBlue
        button.setImage(UIImage(named: "favorites")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(isFavoriteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let shopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shop", for: .normal)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed), for: .touchUpInside)
        return button
    }()
        
    let detailsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed), for: .touchUpInside)
        return button
    }()
        
    let featuresButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Features", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 20)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let cpuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cpu")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return imageView
    }()
    
    let cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "camera")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return imageView
    }()
    
    let ssdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ssd")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return imageView
    }()
    
    let sdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sd")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return imageView
    }()
    
    let cpuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Exynos 990"
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return label
    }()
    
    let cameraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "108 + 12 mp"
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return label
    }()
    
    let ssdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8 GB"
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return label
    }()
    
    let sdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "256 GB"
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        return label
    }()
    
    let selectColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select color and capacity"
        label.font = UIFont(name: "MarkPro-Medium", size: 16)
        label.textColor = .brandDarkBlue
        return label
    }()
    
    let firstColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.467, green: 0.175, blue: 0.012, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 19
        button.setImage(UIImage(named: "selectedMark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(selectColorButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let secondColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 19
        button.setImage(UIImage(named: "selectedMark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = button.backgroundColor
        button.addTarget(self, action: #selector(selectColorButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let minSdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        button.backgroundColor = .brandOrange
        button.setTitle("128 GB", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(selectSdButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let maxSdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        button.backgroundColor = .clear
        button.setTitle("256 GB", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(selectSdButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        button.backgroundColor = .brandOrange
        button.setTitle("Add to cart   $1.500.00", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.brandOrange, for: .highlighted)
        button.addTarget(self, action: #selector(addToCartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        stackView.axis = .vertical
        return stackView
    }()
    
    private let starsContainer: UIStackView =  {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private struct Constants {
        static let starsCount: Int = 5
    }
}

// MARK: - UICollectionViewDataSource
extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsImagesCell.reuseIdentifier, for: indexPath) as? DetailsImagesCell
        else { return UICollectionViewCell() }
        cell.modelView.image = UIImage(named: productImages[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension DetailsViewController: UICollectionViewDelegate {
    
}

// MARK: - View setup
extension DetailsViewController {
    private func setUpView() {
        view.backgroundColor = .brandBackground
        navigationBarSetup()
        createStars()
        detailViewSetup()
        addSubviews()
        setupConstraints()
    }
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 140, height: 350)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 80, bottom: 5, right: 80)
        layout.minimumLineSpacing = 80
        layout.scrollDirection = .horizontal
        return layout
    }
    
    private func navigationBarSetup() {
        self.title = "Product Details"
    
        let myCartButton = UIButton()
        myCartButton.translatesAutoresizingMaskIntoConstraints = false
        myCartButton.backgroundColor = .brandOrange
        myCartButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        myCartButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        myCartButton.clipsToBounds = true
        myCartButton.layer.cornerRadius = 10
        myCartButton.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        myCartButton.tintColor = .white
        myCartButton.addTarget(self, action: #selector(myCartOnDetailsTaped), for: .touchUpInside)
        
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .brandDarkBlue
        backButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 10
        backButton.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backOnDetailsTaped), for: .touchUpInside)
        
        let rightBarItem = UIBarButtonItem(customView: myCartButton)
        let leftBarItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = rightBarItem
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    private func addSubviews() {
        view.addSubview(productImagesCollectionView)
        view.addSubview(detailView)
    }

    private func setupConstraints() {
        productImagesCollectionView.delegate = self
        productImagesCollectionView.dataSource = self
        productImagesCollectionView.register(DetailsImagesCell.self,
                                             forCellWithReuseIdentifier: DetailsImagesCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            productImagesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 106),
            productImagesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            productImagesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            productImagesCollectionView.heightAnchor.constraint(equalToConstant: 360),
            
            detailView.topAnchor.constraint(equalTo: productImagesCollectionView.bottomAnchor, constant: 5),
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func detailViewSetup() {
        detailButtons.append(contentsOf: [shopButton, detailsButton, featuresButton])
        colorButtons.append(contentsOf: [firstColorButton, secondColorButton])
        sdButtons.append(contentsOf: [minSdButton, maxSdButton])
        detailView.addSubview(titleLabel)
        detailView.addSubview(isFavoriteButton)
        detailView.addSubview(container)
        detailView.addSubview(starsContainer)
        detailView.addSubview(shopButton)
        detailView.addSubview(detailsButton)
        detailView.addSubview(featuresButton)
        detailView.addSubview(cpuImageView)
        detailView.addSubview(cameraImageView)
        detailView.addSubview(ssdImageView)
        detailView.addSubview(sdImageView)
        detailView.addSubview(cpuLabel)
        detailView.addSubview(cameraLabel)
        detailView.addSubview(ssdLabel)
        detailView.addSubview(sdLabel)
        detailView.addSubview(selectColorLabel)
        detailView.addSubview(firstColorButton)
        detailView.addSubview(secondColorButton)
        detailView.addSubview(minSdButton)
        detailView.addSubview(maxSdButton)
        detailView.addSubview(addToCartButton)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 28),
            titleLabel.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 38),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 250),
            
            isFavoriteButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            isFavoriteButton.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -37),
            isFavoriteButton.heightAnchor.constraint(equalToConstant: 33),
            isFavoriteButton.widthAnchor.constraint(equalToConstant: 37),
            
            container.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            container.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 38),
            container.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -250),
            starsContainer.heightAnchor.constraint(equalToConstant: 40),
            
            shopButton.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            shopButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 28),
            shopButton.heightAnchor.constraint(equalToConstant: 30),
            shopButton.widthAnchor.constraint(equalToConstant: 88),
            
            detailsButton.topAnchor.constraint(equalTo: shopButton.topAnchor),
            detailsButton.leftAnchor.constraint(equalTo: shopButton.rightAnchor, constant: 39),
            detailsButton.heightAnchor.constraint(equalTo: shopButton.heightAnchor),
            detailsButton.widthAnchor.constraint(equalTo: shopButton.widthAnchor),
            
            featuresButton.topAnchor.constraint(equalTo: shopButton.topAnchor),
            featuresButton.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -39),
            featuresButton.heightAnchor.constraint(equalTo: shopButton.heightAnchor),
            featuresButton.widthAnchor.constraint(equalTo: shopButton.widthAnchor),
            
            cpuImageView.topAnchor.constraint(equalTo: shopButton.bottomAnchor, constant: 33),
            cpuImageView.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 45),
            cpuImageView.heightAnchor.constraint(equalToConstant: 28),
            cpuImageView.widthAnchor.constraint(equalToConstant: 28),
            
            cameraImageView.bottomAnchor.constraint(equalTo: cpuImageView.bottomAnchor),
            cameraImageView.leftAnchor.constraint(equalTo: cpuImageView.rightAnchor, constant: 74),
            cameraImageView.heightAnchor.constraint(equalToConstant: 22),
            cameraImageView.widthAnchor.constraint(equalTo: cpuImageView.widthAnchor),
            
            ssdImageView.bottomAnchor.constraint(equalTo: cpuImageView.bottomAnchor),
            ssdImageView.leftAnchor.constraint(equalTo: cameraImageView.rightAnchor, constant: 74),
            ssdImageView.heightAnchor.constraint(equalToConstant: 21),
            ssdImageView.widthAnchor.constraint(equalTo: cpuImageView.widthAnchor),
            
            sdImageView.bottomAnchor.constraint(equalTo: cpuImageView.bottomAnchor),
            sdImageView.leftAnchor.constraint(equalTo: ssdImageView.rightAnchor, constant: 74),
            sdImageView.heightAnchor.constraint(equalToConstant: 21),
            sdImageView.widthAnchor.constraint(equalToConstant: 18),
            
            cpuLabel.topAnchor.constraint(equalTo: cpuImageView.bottomAnchor, constant: 3),
            cpuLabel.centerXAnchor.constraint(equalTo: cpuImageView.centerXAnchor),
            cpuLabel.heightAnchor.constraint(equalToConstant: 11),
            cpuLabel.widthAnchor.constraint(equalToConstant: 64),
            
            cameraLabel.topAnchor.constraint(equalTo: cpuImageView.bottomAnchor, constant: 3),
            cameraLabel.centerXAnchor.constraint(equalTo: cameraImageView.centerXAnchor),
            cameraLabel.heightAnchor.constraint(equalToConstant: 11),
            cameraLabel.widthAnchor.constraint(equalToConstant: 64),
            
            ssdLabel.topAnchor.constraint(equalTo: cpuImageView.bottomAnchor, constant: 3),
            ssdLabel.centerXAnchor.constraint(equalTo: ssdImageView.centerXAnchor),
            ssdLabel.heightAnchor.constraint(equalToConstant: 11),
            ssdLabel.widthAnchor.constraint(equalToConstant: 27),
            
            sdLabel.topAnchor.constraint(equalTo: cpuImageView.bottomAnchor, constant: 3),
            sdLabel.centerXAnchor.constraint(equalTo: sdImageView.centerXAnchor),
            sdLabel.heightAnchor.constraint(equalToConstant: 11),
            sdLabel.widthAnchor.constraint(equalToConstant: 48),
            
            selectColorLabel.topAnchor.constraint(equalTo: cpuLabel.bottomAnchor, constant: 29),
            selectColorLabel.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 30),
            selectColorLabel.heightAnchor.constraint(equalToConstant: 21),
            selectColorLabel.widthAnchor.constraint(equalToConstant: 216),
            
            firstColorButton.topAnchor.constraint(equalTo: selectColorLabel.bottomAnchor, constant: 14),
            firstColorButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 34),
            firstColorButton.heightAnchor.constraint(equalToConstant: 39),
            firstColorButton.widthAnchor.constraint(equalToConstant: 39),
            
            secondColorButton.topAnchor.constraint(equalTo: firstColorButton.topAnchor),
            secondColorButton.leftAnchor.constraint(equalTo: firstColorButton.rightAnchor, constant: 18),
            secondColorButton.heightAnchor.constraint(equalToConstant: 39),
            secondColorButton.widthAnchor.constraint(equalToConstant: 39),
            
            minSdButton.topAnchor.constraint(equalTo: firstColorButton.topAnchor, constant: 2),
            minSdButton.leftAnchor.constraint(equalTo: secondColorButton.rightAnchor, constant: 58),
            minSdButton.heightAnchor.constraint(equalToConstant: 36),
            minSdButton.widthAnchor.constraint(equalToConstant: 71),
            
            maxSdButton.topAnchor.constraint(equalTo: minSdButton.topAnchor),
            maxSdButton.leftAnchor.constraint(equalTo: minSdButton.rightAnchor, constant: 34),
            maxSdButton.heightAnchor.constraint(equalToConstant: 36),
            maxSdButton.widthAnchor.constraint(equalToConstant: 71),
            
            addToCartButton.topAnchor.constraint(equalTo: firstColorButton.bottomAnchor, constant: 27),
            addToCartButton.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 29),
            addToCartButton.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -30),
            addToCartButton.heightAnchor.constraint(equalToConstant: 54),
        ])
        container.addArrangedSubview(starsContainer)
        starsContainer.arrangedSubviews.forEach { subview in
            guard let starImageView = subview as? UIImageView else { return }
            starImageView.isHighlighted = starImageView.tag <= selectedRate
        }
        selectedFontSet(button: shopButton)
    }
}
