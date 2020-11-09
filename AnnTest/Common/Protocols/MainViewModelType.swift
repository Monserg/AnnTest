//
//  MainViewModelType.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import Foundation

protocol MainViewModelType {
    func numberOfRowsInSection() -> Int
    func download_url(byIndexPath indexPath: IndexPath) -> String?
    func fetchPhotographers(completion: @escaping ((Bool) -> Void))
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModel?
    func previewImageViewModel(forIndexPath indexPath: IndexPath) -> PreviewImageViewModel?
}
