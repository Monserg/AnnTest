//
//  UIViewController+Extensions.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

extension UIViewController {
    func hideBackButtonTitle() {
        let backButton = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}
