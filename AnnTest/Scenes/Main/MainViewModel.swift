//
//  MainViewModel.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import Foundation

class MainViewModel: MainViewModelType {
    // MARK: - Properties
    private var photographers: [Photographer]?
    
    
    // MARK: - MainViewModelType protocol
    func numberOfRowsInSection() -> Int {
        return photographers?.count ?? 0
    }
    
    func fetchPhotographers(completion: @escaping ((Bool) -> Void)) {
        NetworkManager().fetchPhotographers() { [weak self] (result, errorDescription) in
            guard errorDescription == nil else { completion(false); return }
            guard let self = self, let items = result as? [Photographer] else { completion(false); return }
            
            self.photographers = items.sorted { $0.author < $1.author }
            completion(true)
        }
    }
    
    func download_url(byIndexPath indexPath: IndexPath) -> String? {
        guard let items = photographers else { return nil }
        return items[indexPath.row].download_url
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        guard let items = photographers else { return nil }
        return CellViewModel(photographer: items[indexPath.row])
    }
}
