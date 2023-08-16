//
//  NewsCell.swift
//  TableViewTask
//
//  Created by Александра Кострова on 15.08.2023.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let identifier = Constants.Cells.newsCell
    private lazy var margin = Constants.Constraints.smallMargin
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = Constants.Fonts.universalFont
        label.textAlignment = .left
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = Constants.Fonts.universalFont
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .fillEqually
        stackView.addSomeSubviews([titleLabel, dateLabel])
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
            cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin)
        ])
    }
    
    public func configure(with model: NewsRecordModel) {
        dateLabel.text = model.publishedAt
        titleLabel.text = model.title
    }
}
