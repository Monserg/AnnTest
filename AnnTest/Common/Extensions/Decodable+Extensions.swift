//
//  Decodable+Extensions.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//


import UIKit

extension Decodable {
    static func parse(jsonFile: String) -> Self? {
        guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"), let data = try? Data(contentsOf: url), let output = try? JSONDecoder().decode(self, from: data)
        else { return nil }
        return output
    }
}
