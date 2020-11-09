//
//  URLSession+Extensions.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 08.11.2020.
//

import UIKit
import Combine


extension URLSession {
    func fetchImage(for url: URL, placeholder: UIImage? = nil) -> AnyPublisher<UIImage?, Never> {
        return dataTaskPublisher(for: url)
            .tryMap { data, response -> UIImage in
                guard let image = UIImage(data: data) else { throw ResponceError.invalidResponse }
                return image
            }
            .replaceError(with: placeholder)
            .eraseToAnyPublisher()
    }
}
