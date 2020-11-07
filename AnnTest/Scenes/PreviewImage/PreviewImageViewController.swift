//
//  PreviewImageViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//

import UIKit

class PreviewImageViewController: UIViewController {
    // MARK: - Properties
    var download_url: String!
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Image preview"
        imageView.downloadImage(byURL: download_url)
    }
}
