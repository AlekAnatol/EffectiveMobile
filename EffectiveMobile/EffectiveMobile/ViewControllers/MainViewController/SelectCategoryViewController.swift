//
//  SelectCategoryViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 03.12.2022.
//

import UIKit

final class SelectCategoryViewController: UIViewController {
    
    // MARK: - Properties
    private let collectionItems = ["Phones", "Computer", "Health", "Books", "Other"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func viewAllButtonTaped(_ sender: UIButton) {
        print("viewAllButtonTaped")
    }

    @objc private func searchButtonTaped(_ sender: UIButton) {
        print("searchButtonTaped")
        print("word for searching = ", searchTextField.text ?? "no word")
    }
    
    //MARK: - Private Methods
    
    private func setBrandOrangeColor(_ cell: SelectCategoryCell) {
        cell.categoryLabel.textColor = .brandOrange
        cell.categoryView.backgroundColor = .brandOrange
        let image = cell.categoryImage.image?.withTintColor(.white)
        cell.categoryImage.image = image
    }

    private func setWhiteColor(_ cell: SelectCategoryCell) {
        cell.categoryLabel.textColor = .black
        cell.categoryView.backgroundColor = .white
        let image = cell.categoryImage.image?.withTintColor(.gray)
        cell.categoryImage.image = image
    }

    // MARK: - Visual components
    private var selectedCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .brandBackground
        label.textColor = .black
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.text = "Select Category"
        return label
    }()

    private var viewAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandBackground
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 15)
        button.setTitle("view all", for: .normal)
        button.setTitleColor(.brandOrange, for: .normal)
        button.setTitleColor(.brandBackground, for: .highlighted)
        button.addTarget(self, action: #selector(viewAllButtonTaped(_:)), for: .touchUpInside)
        return button
    }()

     lazy private var selectCategoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: 150),                            collectionViewLayout: setUpFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .brandBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SelectCategoryCell.self, forCellWithReuseIdentifier: "reuse")
        return collectionView
    }()

   
   private var searchTextView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 34))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 17
        let loupeImageView = UIImageView(frame: CGRect(x: 24, y: 9, width: 20, height: 20))
        let loupeImage = UIImage(named: "loupe")?.withRenderingMode(.alwaysTemplate)
        loupeImageView.image = loupeImage
        loupeImageView.tintColor = .brandOrange
        view.addSubview(loupeImageView)
        return view
    }()

    private var searchTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 64, y: 0, width: 215, height: 34))
        textField.placeholder = "Search"
        textField.font = UIFont(name: "MarkPro-Regular", size: 12)
        return textField
    }()


    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 17
        button.backgroundColor = .brandOrange
        button.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(searchButtonTaped), for: .touchUpInside)
        return button
    }()
}

// MARK: - UICollectionViewDataSource
extension SelectCategoryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as? SelectCategoryCell
        else { return UICollectionViewCell() }
        cell.categoryLabel.text = collectionItems[indexPath.item]
        let image = UIImage(named: collectionItems[indexPath.item])
        let newImage = image?.withTintColor(.lightGray)
        cell.categoryImage.image = newImage
        if indexPath.item == 0 {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
            setBrandOrangeColor(cell)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SelectCategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCell else { return }
        setBrandOrangeColor(cell)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCell else { return }
        setWhiteColor(cell)
    }
}

// MARK: - View setup
extension SelectCategoryViewController {
    private func setUpView() {
        addSubviews()
        setupConstraints()
        selectCategoryCollectionView.dataSource = self
        selectCategoryCollectionView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(selectedCategoryLabel)
        view.addSubview(viewAllButton)
        view.addSubview(selectCategoryCollectionView)
        view.addSubview(searchTextView)
        view.addSubview(searchButton)
        searchTextView.addSubview(searchTextField)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            selectedCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            selectedCategoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            selectedCategoryLabel.heightAnchor.constraint(equalToConstant: 32),
            selectedCategoryLabel.widthAnchor.constraint(equalToConstant: 200),

            viewAllButton.widthAnchor.constraint(equalToConstant: 55),
            viewAllButton.heightAnchor.constraint(equalToConstant: 19),
            viewAllButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 329),
            viewAllButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),

            selectCategoryCollectionView.topAnchor.constraint(equalTo: selectedCategoryLabel.bottomAnchor, constant: 20),
            selectCategoryCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            selectCategoryCollectionView.heightAnchor.constraint(equalToConstant: 120),

            searchTextView.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor, constant: 35),
            searchTextView.widthAnchor.constraint(equalToConstant: 300),
            searchTextView.heightAnchor.constraint(equalToConstant: 34),
            searchTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),

            searchButton.topAnchor.constraint(equalTo: searchTextView.topAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 34),
            searchButton.heightAnchor.constraint(equalToConstant: 34),
            searchButton.leftAnchor.constraint(equalTo: searchTextView.rightAnchor, constant: 11)
        ])
    }
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 71, height: 105)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 12)
        layout.minimumLineSpacing = 23
        layout.scrollDirection = .horizontal
        return layout
    }

}
