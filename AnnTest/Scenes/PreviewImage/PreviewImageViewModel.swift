//
//  PreviewImageViewModel.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

class PreviewImageViewModel: PreviewImageViewModelType {
    // MARK: - Properties
    private var url: String

    
    // MARK: - Initialization
    init(withURL url: String) {
        self.url = url
    }
    
    
    // MARK: - PreviewImageViewModelTypeprotocol
    func downloadImage(completion: @escaping ((UIImage?) -> Void)) {
        guard let url = URL(string: url) else { completion(nil); return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { completion(nil); return }
            
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }
    }
}
