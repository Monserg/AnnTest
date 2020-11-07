//
//  StoreViewModel.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

class StoreViewModel: StoreViewModelType {
    // MARK: - StoreViewModelType protocol
    func loadStoredValue(completion: @escaping ((String?) -> Void)) {
        completion(Store.loadStoredValue())
    }
}
