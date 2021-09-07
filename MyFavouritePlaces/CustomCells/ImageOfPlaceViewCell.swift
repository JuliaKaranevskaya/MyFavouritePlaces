//
//  ImageOfPlaceViewCell.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 4.09.21.
//

import UIKit

class ImageOfPlaceViewCell: UITableViewCell {
    
    let imageOfPlace: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    static let identifierOfImageOfPlaceCell = "imageOfPlaceCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageOfPlace()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImageOfPlace() {
        contentView.addSubview(imageOfPlace)
        imageOfPlace.translatesAutoresizingMaskIntoConstraints = false
        imageOfPlace.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageOfPlace.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        imageOfPlace.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        imageOfPlace.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
    
}
