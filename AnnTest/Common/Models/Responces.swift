//
//  Responces.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//

import UIKit

struct Photographer: Decodable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}
