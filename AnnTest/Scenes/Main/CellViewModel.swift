//
//  CellViewMdelType.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import Foundation

class CellViewModel: CellViewModelType {
    // MARK: - Properties
    private let photographer: Photographer
    
    
    // MARK: - Initialization
    init(photographer: Photographer) {
        self.photographer = photographer
    }
    
    
    // MARK: - CellViewModelType protocol
    var author: String {
        return photographer.author
    }
}
