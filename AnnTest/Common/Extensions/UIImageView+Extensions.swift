//
//  UIImageView+Extensions.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 07.11.2020.
//

import UIKit

extension UIImageView {
    func downloadImage(byURL string: String) {
        guard let url = URL(string: string) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
