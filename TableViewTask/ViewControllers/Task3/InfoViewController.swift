//
//  InfoViewController.swift
//  TableViewTask
//
//  Created by Александра Кострова on 18.08.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var margin = Constants.Constraints.maxMargin
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textColor = .label
        label.font = Constants.Fonts.boldTitle
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = Constants.Fonts.universalFont
        label.textAlignment = .left
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = Constants.Fonts.locationLabel
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .fillProportionally
        stackView.addSomeSubviews([mainLabel, descriptionLabel, locationLabel])
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(postStackView)
        postStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            postStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
            postStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            postStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin)
        ])
    }

    public func configure(with model: NewsWithLocationModel) {
        descriptionLabel.text = "Description:\n\(model.description)"
        locationLabel.text = "Location:\n\(model.location)"
    }
}
