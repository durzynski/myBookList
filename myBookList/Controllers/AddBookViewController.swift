//
//  AddBookViewController.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation
import UIKit

protocol AddBookViewControllerDelegate: AnyObject {
    func didAddBook()
}

class AddBookViewController: UIViewController {
    
    private var addBookViewModel = AddBookViewModel()
    
    let customView = AddBookView()
    
    weak var delegate: AddBookViewControllerDelegate?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        addViewGestureRecognizer()
    }
    
    override func loadView() {
        super.loadView()
        
        view = customView
    }
    
    
}

//MARK: - Configure UI

extension AddBookViewController {

    private func configureNavigation() {
        title = "Add new book"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addNewBook))
        
        navigationController?.navigationBar.barTintColor = .systemRed
        navigationController?.navigationBar.isTranslucent = true
        
    }
    

}

//MARK: - Actions

extension AddBookViewController {
   
    @objc func addNewBook() {
        
        addBookViewModel.title = customView.titleView.textField.text ?? ""
        addBookViewModel.author = customView.authorView.textField.text ?? ""
        addBookViewModel.readPages = customView.numberOfPagesReadView.textField.text ?? ""
        addBookViewModel.allPages = customView.numberOfPagesView.textField.text ?? ""
        addBookViewModel.notes = customView.notesView.textView.text
        
        addBookViewModel.save()
        
        delegate?.didAddBook()
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    private func addViewGestureRecognizer() {
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


