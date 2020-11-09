//
//  MainViewModel.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit
import Combine

class MainViewModel: MainViewModelType {
    // MARK: - Properties
    private let networkManager = NetworkManager()
    private var photographersSubscriber: AnyCancellable?
    private var photographers: [Photographer]?

    
    // MARK: - MainViewModelType protocol
    func numberOfRowsInSection() -> Int {
        return photographers?.count ?? 0
    }
    

    func fetchPhotographers(completion: @escaping ((Bool) -> Void)) {
        networkManager.fetchPhotographers()
        
        photographersSubscriber = networkManager.$photographers.sink(receiveValue: { [weak self] items in
            guard let self = self, items.count > 0 else { completion(false); return }
            self.photographers = items
            completion(true)
        })
    }
    
    func download_url(byIndexPath indexPath: IndexPath) -> String? {
        guard let items = photographers else { return nil }
        return items[indexPath.row].download_url
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModel? {
        guard let items = photographers else { return nil }
        return CellViewModel(photographer: items[indexPath.row])
    }
    
    func previewImageViewModel(forIndexPath indexPath: IndexPath) -> PreviewImageViewModel? {
        guard let items = photographers else { return nil }
        return PreviewImageViewModel(withURL: items[indexPath.row].download_url)
    }
}
