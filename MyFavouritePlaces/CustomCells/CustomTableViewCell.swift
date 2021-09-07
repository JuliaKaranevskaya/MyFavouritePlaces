//
//  CustomTableViewCell.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 2.09.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let cellImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 40
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let l = UILabel()
        return l
    }()
    
    let locationLabel: UILabel = {
        let l = UILabel()
        l.text = "One"
        return l
    }()
    
    let typeLabel: UILabel = {
        let l = UILabel()
        l.text = "Two"
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    
    func setUpContent() {
        setUpCellImageview()
        setUpNameLabel()
        setUpLocationLabel()
        setUpTypeLabel()
    }
    
    func setUpCellImageview() {
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    }
    
    func setUpNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    func setUpLocationLabel() {
        contentView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func setUpTypeLabel() {
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }

}
