import UIKit

class ViewController: UIViewController {
    
    // MARK: - ViewModel
    var viewModel = ViewModel()
    
    
    // MARK: - UI Component
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        viewModel.parseJson { [weak self] in
            self?.tableView.reloadData()
        }
        
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
        return viewModel.allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("The table view cannot deque custom cell in Table View")
        }
        
        
        
        if let imageURL = URL(string: self.viewModel.allData[indexPath.row].downloadURL) {
            viewModel.loadImageFromURL(url: imageURL) { (image) in
                        if let image = image {
//                            cell.configure(with: image, and: self.viewModel.allData[indexPath.row].author)
                            cell.configure(with:image, label: self.viewModel.allData[indexPath.row].author, height: self.viewModel.allData[indexPath.row].height, and: self.viewModel.allData[indexPath.row].width)
                        } else {
                            // Handle error or use a placeholder image
                        }
                    }
                }
        return cell
    }
}

