//
//  StoreViewModelType.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import Foundation

protocol StoreViewModelType {
    func loadStoredValue(completion: @escaping ((String?) -> Void))
}
