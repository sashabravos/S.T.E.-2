//
//  Constants.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
//

import UIKit

enum Constants {
    
    enum Images {
        // System Images
        static let folder = UIImage(systemName: "folder")
    }
    
    enum Fonts {
        // CountryCell
        static let countryLabel = UIFont.systemFont(ofSize: 27.0)
        
        // NewsCell
        static let universalFont = UIFont.systemFont(ofSize: 20.0)
        
        // FactCell
        static let boldTitle = UIFont.systemFont(ofSize: 30.0, weight: .black)
        static let locationLabel = UIFont.systemFont(ofSize: 20.0, weight: .bold)
    }
    
    enum Cells {
        static let countryCell = "CountryCell"
        static let newsCell = "NewsCell"
        static let factCell = "FactCell"
    }
    
    enum Constraints {
        // CountryCell
        static let midMargin = 10.0
        static let imageHeight = 70.0
        static let imageWidth = 90.0
        
        // NewsCell
        static let smallMargin = 5.0
        
        // FactCell
        static let maxMargin = 15.0
    }
    
    enum Lists {
        // Countries
        static let countryNames = ["Austria", "Belgium", "France", "Germany", "Greece"]
    }
    
    enum DateType {
        static let newsDateFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let dotDateFormat: String = "dd.MM.yyyy"
        static let dotDateAndTimeFormat: String = "dd.MM.yyyy HH:mm"
    }
}
