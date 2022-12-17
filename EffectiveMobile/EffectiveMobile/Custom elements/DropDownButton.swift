//
//  DropDownButton.swift
//  EffectiveMobile
//
//  Created by Екатерина Алексеева on 15.12.2022.
//

import UIKit

final class DropDownButton: UIButton, DropDownProtocol {
    var dropView = DropDownView()
    var height = NSLayoutConstraint()
    var isOpen = false
    let arrowDown =  UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1)
        self.contentHorizontalAlignment = .left
        self.addSubview(arrowDown)
        arrowDown.translatesAutoresizingMaskIntoConstraints = false
        arrowDown.image = UIImage(named: "arrowDown")
        dropView = DropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropView.translatesAutoresizingMaskIntoConstraints = false
        dropView.delegate = self
        
        NSLayoutConstraint.activate([
        arrowDown.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
        arrowDown.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
        arrowDown.widthAnchor.constraint(equalToConstant: 15),
        arrowDown.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dropView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func dropDownPresed(choosenItem: String) {
        self.setTitle(choosenItem, for: .normal)
        dismissDropDown()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen {
            dismissDropDown()
        }
        else {
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else  {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveLinear,
                           animations: { self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            },
                           completion: nil)
            isOpen.toggle()
        }
    }
    
    private func dismissDropDown() {
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveLinear,
                       animations: { self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded() },
                       completion: nil)
        isOpen = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


final class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownOptions = [String]()
    let tableView = UITableView()
    var delegate: DropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPresed(choosenItem: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

protocol DropDownProtocol {
    func  dropDownPresed(choosenItem: String)
}
