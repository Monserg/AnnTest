//
//  StoreViewController.swift
//  AnnTest
//
//  Created by Sergey Monastyrskiy on 05.11.2020.
//

import UIKit

class StoreViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var storeTextField: UITextField! {
        didSet {
            storeTextField.delegate = self
        }
    }
    
    
    // MARK: - Class functions
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Store"
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showStoredValue()
    }
    
    
    // MARK: - Custom functions
    func addTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func showStoredValue() {
        storeTextField.text = Store.loadStoredValue()
    }
    
    
    // MARK: - Actions
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}


// MARK: - UITextFieldDelegate
extension StoreViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        Store.create(text: text)
        textField.resignFirstResponder()
        return true
    }
}
