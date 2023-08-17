//
//  TaskThreeViewController.swift
//  TableViewTask
//
//  Created by Александра Кострова on 14.08.2023.
//

import UIKit

class TaskThreeViewController: UIViewController {

    private lazy var tableView = UITableView()
    private lazy var facts = NewsWithLocationModel.modelsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    private func setTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FactCell.self, forCellReuseIdentifier: FactCell.identifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension TaskThreeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FactCell.identifier,
                                                 for: indexPath) as! FactCell
        let info = facts[indexPath.row]
        cell.configure(with: info)
        return cell
    }
}

extension TaskThreeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: FactCell.identifier,
                                                 for: indexPath) as! FactCell
        let info = facts[indexPath.row]
        let infoVC = InfoViewController()
        infoVC.configure(with: info)
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}
