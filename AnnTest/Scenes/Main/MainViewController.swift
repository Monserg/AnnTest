//
//  ViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    private let mainViewModel = MainViewModel()
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
        loadData()
        hideBackButtonTitle()
    }
    
    
    // MARK: - Custom functions
    private func loadData() {
        mainViewModel.fetchPhotographers { [weak self] isSuccess in
            guard let self = self, isSuccess else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }        
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPreviewImageVC",
           let previewImageVC = segue.destination as? PreviewImageViewController,
           let indexPath = tableView.indexPathForSelectedRow,
           let previewImageViewModel = mainViewModel.previewImageViewModel(forIndexPath: indexPath) {
            previewImageVC.previewImageViewModel = previewImageViewModel
        }
    }
}


// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.customCell.rawValue, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.cellViewModel = mainViewModel.cellViewModel(forIndexPath: indexPath)
        return cell
    }
}
