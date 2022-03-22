//
//  AddBookViewModel.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation

struct AddBookViewModel {
    
    func save(with viewModel: BookViewModel) {
        
        let manager = CoreDataManager.shared
        
        let book = Book(context: manager.persistentContainer.viewContext)
        
        book.title = viewModel.title
        book.author = viewModel.author
        book.readPages = viewModel.numberOfPagesRead
        book.allPages = viewModel.numberOfPages
        book.notes = viewModel.notes
        
        manager.save()
        
    }
    
}
