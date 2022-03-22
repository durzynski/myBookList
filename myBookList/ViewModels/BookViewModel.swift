//
//  BookViewModel.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation

struct BookListViewModel {
    
    let books = [Book]()
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return books.count
    }
    
    func bookAtIndex(_ index: Int) -> BookViewModel {
        let book = books[index]
        
        return BookViewModel(book: book)
    }
    
}

struct BookViewModel {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title?.capitalized ?? ""
    }
    
    var author: String {
        return book.author ?? ""
    }
    
    var notes: String {
        return book.notes ?? ""
    }
    
    var numberOfPages: Int16 {
        return book.allPages
    }
    
    var numberOfPagesRead: Int16 {
        return book.readPages
    }
    
    var readingProgress: Double {
        return Double(numberOfPagesRead / numberOfPages)
    }
}
