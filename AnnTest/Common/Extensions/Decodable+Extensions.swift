//
//  Decodable+Extensions.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//


import UIKit

typealias ParseResult = (model: Decodable?, error: String?)

extension Decodable {
    // Download data
    static func parse(data: Data) -> ParseResult {
        do {
            return (try JSONDecoder().decode(self, from: data), nil)
        } catch {
            return (nil, error.localizedDescription)
        }
    }

    // Read from local file
    static func parse(jsonFile: String) -> Self? {
        guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"), let data = try? Data(contentsOf: url), let output = try? JSONDecoder().decode(self, from: data)
        else { return nil }
        return output
    }
}
