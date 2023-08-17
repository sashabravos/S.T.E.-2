//
//  CountryCell.swift
//  TableViewTask
//
//  Created by Александра Кострова on 16.08.2023.
//

import UIKit

class CountryCell: UITableViewCell {
    
    static let identifier = Constants.Cells.countryCell
    private lazy var margin = Constants.Constraints.midMargin
    
    private lazy var countryName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = Constants.Fonts.countryLabel
        label.textAlignment = .center
        return label
    }()
    
    private lazy var countryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addSomeSubviews([countryImage, countryName])
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        self.addSubview(cellStackView)
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin),
            cellStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
            
            countryImage.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.Constraints.imageHeight),
            countryImage.widthAnchor.constraint(equalToConstant: Constants.Constraints.imageWidth)
        ])
    }
    
    public func configure(name: String) {
        countryName.text = name
        countryImage.image = UIImage(named: name)
    }
}

