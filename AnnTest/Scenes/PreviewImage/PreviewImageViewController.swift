//
//  PreviewImageViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 06.11.2020.
//

import UIKit
import Combine

class PreviewImageViewController: UIViewController {
    // MARK: - Properties
    private var imageSubscriber: AnyCancellable?

    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var previewImageViewModel: PreviewImageViewModel!
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        view.showLoading()
        title = "Image preview"

        bindViewModel()
        downloadImage()
    }
    
    private func bindViewModel() {
        imageSubscriber = previewImageViewModel.$image.receive(on: DispatchQueue.main).assign(to: \.image, on: imageView)
    }
    
    private func downloadImage() {
        previewImageViewModel.downloadImage {
            self.view.stopLoading()
        }
    }
}
