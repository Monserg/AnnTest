//
//  CustomTableViewCell.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    var cellViewModel: CellViewModelType! {
        didSet {
            textLabel?.text = cellViewModel.author
        }
    }
}
