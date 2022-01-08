//
//  ThirteenViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 08.01.2022.
//

import UIKit

class ThirteenViewController: UIViewController {

    let tableViewController = UITableViewController(style: .plain)
    var allItem = ["Robbinson", "Jobs", "Gilbert"]
    var cellIdentifier = "Cell"
    var refresh = UIRefreshControl()
    var allTime = [Date]()
    
    var square = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Thirteen VC"
        self.view.backgroundColor = .systemBlue
        self.tabBarController?.tabBar.isHidden = true
        
        createTableView()
        view.addSubview(tableViewController.tableView)
        
        
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refresh.tintColor = .red
        tableViewController.tableView.addSubview(refresh)
        
        
    }
    
    @objc func handleRefresh(){
        allTime.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTime.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent{
            super.tabBarController?.tabBar.isHidden = false
        }
    }
    
    func createTableView(){
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }

}

extension ThirteenViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let date = allTime[indexPath.row]
        cell.textLabel?.text = "(\(date)"
        return cell
    }
}
