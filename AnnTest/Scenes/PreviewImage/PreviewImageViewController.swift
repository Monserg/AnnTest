//
//  PreviewImageViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//

import UIKit

class PreviewImageViewController: UIViewController {
    // MARK: - Properties
    var previewImageViewModel: PreviewImageViewModelType!
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        view.showLoading()
        title = "Image preview"
        
        previewImageViewModel.downloadImage(completion: { [weak self] image in
            guard let self = self else { return }
            self.imageView.image = image
            self.view.stopLoading()
        })
    }
}
