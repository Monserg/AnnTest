//
//  NetworkManager.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit
import Combine

typealias ComplitionHandler = (model: [Decodable]?, error: String?)

class NetworkManager {
    // MARK: - Properties
    @Published var photographers = [Photographer]()
    var cancellable: AnyCancellable?

    
    // MARK: - Custom functions
    func fetchPhotographers() {
        let url = URL(string: "https://picsum.photos/v2/list")!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)

        let repoPublisher = publisher
            .map(\.data)
            .decode(type: [Photographer].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)

        cancellable = repoPublisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            },
            receiveValue: { repo in
                self.photographers = repo
            }
        )
    }
}
