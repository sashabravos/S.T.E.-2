//
//  TaskTwoViewController.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
//

import UIKit

class TaskTwoViewController: UIViewController {

    private lazy var tableView = UITableView()
    private lazy var news = NewsRecordModel.modelsArray
    private var newRecordModel: NewsRecordModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier,
                                                 for: indexPath) as! NewsCell
        let info = news[indexPath.row]
        cell.configure(with: info)
        return cell
    }
}
