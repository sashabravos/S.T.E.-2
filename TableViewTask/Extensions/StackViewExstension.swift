//
//  StackViewExstension.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
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
