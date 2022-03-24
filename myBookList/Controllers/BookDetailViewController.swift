//
//  BookDetailViewController.swift
//  myBookList
//
//  Created by Damian Durzyński on 24/03/2022.
//


import Foundation
import UIKit

class BookDetailViewController: UIViewController {
    
    private var addBookViewModel = AddBookViewModel()
    
    private let viewModel: BookViewModel?
    
    let customView = AddBookView()
    
    init(viewModel: BookViewModel) {
        
        self.viewModel = viewModel
        
        customView.titleView.textField.text = viewModel.title
        customView.authorView.textField.text = viewModel.author
        customView.numberOfPagesReadView.textField.text = String(viewModel.numberOfPagesRead)
        customView.numberOfPagesView.textField.text = String(viewModel.numberOfPages)
        customView.notesView.textView.text = viewModel.notes
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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

extension BookDetailViewController {

    private func configureNavigation() {
        title = "Book Details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editBook))
        
    }
    

}

//MARK: - Actions

extension BookDetailViewController {
   
    @objc func editBook() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        CoreDataManager.shared.delete(book: viewModel.book)
        
        addBookViewModel.title = customView.titleView.textField.text ?? ""
        addBookViewModel.author = customView.authorView.textField.text ?? ""
        addBookViewModel.readPages = customView.numberOfPagesReadView.textField.text ?? ""
        addBookViewModel.allPages = customView.numberOfPagesView.textField.text ?? ""
        addBookViewModel.notes = customView.notesView.textView.text
        
        addBookViewModel.save()
        
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

