//
//  FactCell.swift
//  TableViewTask
//
//  Created by Александра Кострова on 18.08.2023.
//

import UIKit

class FactCell: UITableViewCell {
    
    static let identifier = Constants.Cells.factCell
    private lazy var margin = Constants.Constraints.maxMargin
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = Constants.Fonts.universalFont
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin)
        ])
    }
    
    public func configure(with model: NewsWithLocationModel) {
        nameLabel.text = model.name
    }
}
