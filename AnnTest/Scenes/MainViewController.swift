//
//  ViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    var items: [Photographer]!
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackButtonTitle()
        title = "Main"
        
        loadData()
    }
    
    
    // MARK: - Custom functions
    private func loadData() {
        NetworkManager().getPhotographersCountries() { [weak self] (result, errorDescription) in
            guard errorDescription == nil else { return }
            guard let self = self, let items = result as? [Photographer] else { return }
            
            self.items = items.sorted { $0.author < $1.author }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPreviewImageVC",
           let previewImageVC = segue.destination as? PreviewImageViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            previewImageVC.download_url = items[indexPath.row].download_url
        }
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
