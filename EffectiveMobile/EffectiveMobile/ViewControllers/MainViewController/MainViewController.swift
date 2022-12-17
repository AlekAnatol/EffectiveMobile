//
//  MainViewController.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 13.12.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    let selectCategoryViewController = SelectCategoryViewController()
    let hotSalesViewController = HotSalesViewController()
    let bestSellerViewController = BestSellerViewController()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Actions
    @objc private func filterButtonTaped() {
        let filterViewController = FilterViewController()
        if let sheet = filterViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
        }
        present(filterViewController, animated: true)
        print("filterButtonTaped")
    }
    
    @objc private func myCartButtonTaped() {
        print("myCartButtonTaped")
    }
    
    @objc private func favoritesButtonTaped() {
        print("favoritesButtonTaped")
    }
    
    @objc private func myProfileButtonTaped() {
        print("myProfileButtonTaped")
    }
    
    // MARK: - Visual components
    private var customTabBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .brandDarkBlue
        
        let dotView = UIView()
        dotView.translatesAutoresizingMaskIntoConstraints = false
        dotView.clipsToBounds = true
        dotView.layer.cornerRadius = 4
        dotView.backgroundColor = .white
        
        
        let explorerLabel = UILabel()
        explorerLabel.translatesAutoresizingMaskIntoConstraints = false
        explorerLabel.backgroundColor = .brandDarkBlue
        explorerLabel.textColor = .white
        explorerLabel.font = UIFont(name: "MarkPro-Bold", size: 15)
        explorerLabel.text = "Explorer"
        
        let myCartButton = UIButton()
        myCartButton.translatesAutoresizingMaskIntoConstraints = false
        myCartButton.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        myCartButton.tintColor = .white
        myCartButton.addTarget(self, action: #selector(myCartButtonTaped), for: .touchUpInside)
        
        let favoritesButton = UIButton()
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.setImage(UIImage(named: "favorites")?.withRenderingMode(.alwaysTemplate),
                                 for: .normal)
        favoritesButton.tintColor = .white
        favoritesButton.addTarget(self, action: #selector(favoritesButtonTaped),
                                  for: .touchUpInside)
        
        let myProfileButton = UIButton()
        myProfileButton.translatesAutoresizingMaskIntoConstraints = false
        myProfileButton.setImage(UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate), for: .normal)
        myProfileButton.tintColor = .white
        myProfileButton.addTarget(self, action: #selector(myProfileButtonTaped),
                                  for: .touchUpInside)
        return view
    }()
    
    private var geoLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let geoIconImageView = UIImageView()
        geoIconImageView.image = UIImage(named: "geopoint")
        geoIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let geoLabel = UILabel()
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.text = "Zihuatanejo, Gro"
        geoLabel.font = UIFont(name: "MarkPro-Medium", size: 15)
        geoLabel.textColor = .brandDarkBlue
        
        
        let arrowDown =  UIImageView()
        arrowDown.translatesAutoresizingMaskIntoConstraints = false
        arrowDown.image = UIImage(named: "arrowDown")
        
        view.addSubview(geoIconImageView)
        view.addSubview(geoLabel)
        view.addSubview(arrowDown)
        
        NSLayoutConstraint.activate([
            geoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            geoIconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            geoIconImageView.heightAnchor.constraint(equalToConstant: 16),
            geoIconImageView.widthAnchor.constraint(equalToConstant: 12),
            geoIconImageView.trailingAnchor.constraint(equalTo: geoLabel.leadingAnchor, constant: -11),
            arrowDown.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowDown.leadingAnchor.constraint(equalTo: geoLabel.trailingAnchor, constant: 8),
            arrowDown.widthAnchor.constraint(equalToConstant: 10),
            arrowDown.heightAnchor.constraint(equalToConstant: 5)])
        
        return view
    }()
    
    
}

// MARK: - View setup
extension MainViewController {
    private func setUpView() {
        view.backgroundColor = .brandBackground
        addChildViewControllers()
        setChildControllersConstrints()
        view.addSubview(customTabBar)
        tabbarSetup()
        navigationBarSetup()
    }
    
    private func addChildViewControllers() {
        addChild(selectCategoryViewController)
        view.addSubview(selectCategoryViewController.view)
        selectCategoryViewController.didMove(toParent: self)
        
        addChild(hotSalesViewController)
        view.addSubview(hotSalesViewController.view)
        hotSalesViewController.didMove(toParent: self)
        
        addChild(bestSellerViewController)
        view.addSubview(bestSellerViewController.view)
        bestSellerViewController.didMove(toParent: self)
    }
    
    private func setChildControllersConstrints() {
        selectCategoryViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hotSalesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        bestSellerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectCategoryViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            selectCategoryViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            selectCategoryViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            selectCategoryViewController.view.heightAnchor.constraint(equalToConstant: 350),
            
            hotSalesViewController.view.topAnchor.constraint(equalTo: selectCategoryViewController.view.bottomAnchor),
            hotSalesViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hotSalesViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hotSalesViewController.view.heightAnchor.constraint(equalToConstant: 230),
            
            bestSellerViewController.view.topAnchor.constraint(equalTo: hotSalesViewController.view.bottomAnchor),
            bestSellerViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            bestSellerViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            bestSellerViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72),
        ])
        
    }
    
    private func navigationBarSetup() {
        navigationItem.titleView = geoLabelView
        let filterBarItem = UIBarButtonItem(image: UIImage(named: "filter")?.withRenderingMode(.alwaysTemplate),
                                            style: .plain,
                                            target: self,
                                            action: #selector(filterButtonTaped))
        filterBarItem.tintColor = .black
        navigationItem.rightBarButtonItem = filterBarItem
    }
    
    private func tabbarSetup() {
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -72),
            customTabBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            customTabBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
