//
//  ViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    var items: [Photographer]?
    
    
    // MARK: - IBOutlets

    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        hideBackButtonTitle()
        title = "Main"
        
        loadData()
    }
    
    
    // MARK: - Custom functions
    func loadData() {
        items = [Photographer].parse(jsonFile: "items")
    }
}


// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items?[indexPath.row].author
        return cell
    }
}


// MARK: - UITableViewDelegate
extension MainViewController {
    
}
