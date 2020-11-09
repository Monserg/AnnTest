//
//  PreviewImageViewModelType.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

protocol PreviewImageViewModelType {
    func downloadImage(completion: @escaping (() -> Void))
}
