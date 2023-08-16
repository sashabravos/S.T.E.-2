//
//  StackViewExtension.swift
//  TableViewTask
//
//  Created by Александра Кострова on 16.08.2023.
//

import UIKit

extension UIStackView {
    func addSomeSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addArrangedSubview(view)
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
