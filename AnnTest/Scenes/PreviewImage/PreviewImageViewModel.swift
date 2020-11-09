//
//  PreviewImageViewModel.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit
import Combine

final class PreviewImageViewModel: ViewModel, PreviewImageViewModelType {    
    // MARK: - Properties
    private var url: URL
    
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    
    // MARK: - Initialization
    init(withURL url: String) {
        self.url = URL(string: url)!
    }
    
    
    // MARK: - PreviewImageViewModelType protocol
    func downloadImage(completion: @escaping (() -> Void)) {
            let publisher = URLSession.shared.fetchImage(for: url, placeholder: UIImage(named: ""))
                .receive(on: DispatchQueue.main)

        self.cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    
                case .finished:
                    break
                }
            },
            receiveValue: { value in
                self.image = value
                completion()
            }
        )
    }
}
