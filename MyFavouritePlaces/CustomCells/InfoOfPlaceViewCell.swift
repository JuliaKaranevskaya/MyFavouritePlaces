//
//  InfoOfPlaceViewCell.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 4.09.21.
//

import UIKit

class InfoOfPlaceViewCell: UITableViewCell {

    static let identifierOfInfoOfPlaceViewCell = "infoOfPlaceViewCellIdentifier"
    
    let placeLabel: UILabel = {
        let pl = UILabel()
        return pl
    }()
    
    let placeTextField: UITextField = {
        let ptf = UITextField()
        ptf.borderStyle = .roundedRect
        return ptf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setPlaceLabel()
        setPlaceTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setPlaceLabel() {
        contentView.addSubview(placeLabel)
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        placeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        placeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setPlaceTextField() {
        contentView.addSubview(placeTextField)
        placeTextField.translatesAutoresizingMaskIntoConstraints = false
        placeTextField.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 15).isActive = true
        placeTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        placeTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        placeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
