//
//  ViewController.swift
//  Task
//
//  Created by Anuj Soni on 26/05/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - ViewModel
    let viewModel = ViewModel()

    
    // MARK: - UI Component
    private let tableView:UITableView = {
       let tableView = UITableView()
       tableView.backgroundColor = .systemBackground
       tableView.allowsSelection = true
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       return tableView
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.parseJson()
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    // MARK: - setupUI
    private func setupUI(){
        
        self.view.backgroundColor = .systemBlue
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
         
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print()
        print(viewModel.allData)
        return viewModel.allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
}

