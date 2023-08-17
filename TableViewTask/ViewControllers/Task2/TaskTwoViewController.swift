//
//  TaskTwoViewController.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
//

import UIKit

class TaskTwoViewController: UIViewController {
    
    private lazy var tableView = UITableView()
    private var viewModel = TaskTwoViewModel()
    private var infoDictionary: Dictionary<Date, [SectionModel]> = [:]
    private var sortedKeysArray: [Date] = []
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateType.dotDateFormat
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoDictionary = viewModel.dictionaryByDate
        sortedKeysArray = Array(infoDictionary.keys).sorted()
        setTableView()
    }
    
    private func setTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension TaskTwoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedKeysArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionItem = sortedKeysArray[section]
        if let sectionModels = infoDictionary[sectionItem] {
            return sectionModels.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionItem = sortedKeysArray[section]
        return "Section title: \((dateFormatter.string(for: sectionItem)) ?? "SectionHeaderError")"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        let section = sortedKeysArray[indexPath.section]
        if let sectionModels = infoDictionary[section] {
            let info = sectionModels[indexPath.row]
            cell.configure(with: info)
        }
        return cell
    }
}
