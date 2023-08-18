//
//  TaskTwoViewModel.swift
//  TableViewTask
//
//  Created by Александра Кострова on 17.08.2023.
//

import UIKit

class TaskTwoViewModel {
    private var sectionModels: [SectionModel] = []
    private var calendar = Calendar.current
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateType.newsDateFormat
        return formatter
    }()
    
    lazy var dictionaryByDate: Dictionary<Date, [SectionModel]> = {
        sectionModels = NewsRecordModel.modelsArray.compactMap { model in
            if let publishedDate = dateFormatter.date(from: model.publishedAt) {
                let components = calendar.dateComponents([.day, .month, .year], from: publishedDate)
                if let finalDate = calendar.date(from: components) {
                    return SectionModel(news: model.title, date: finalDate)
                }
            }
            return nil
        }
        
        let groupedDict = Dictionary(grouping: sectionModels, by: { $0.date })

        return groupedDict
    }()
}


