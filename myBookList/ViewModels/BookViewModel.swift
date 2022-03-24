//
//  BookViewModel.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation

struct BookListViewModel {
    
    var books = [BookViewModel]()
    
    mutating func getBooks() {
        let books = CoreDataManager.shared.fetchData()
        
        self.books = books.map({ book in
            BookViewModel(book: book)
        })
    }
    
    func deleteBook(viewModel: BookViewModel) {

        CoreDataManager.shared.delete(book: viewModel.book)
        
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
    
    var readingProgress: Float {
        
        let result = Float(numberOfPagesRead) / Float(numberOfPages)

        if result > 1 {
            return 1
        }
        
        return Float(numberOfPagesRead) / Float(numberOfPages)
    }
    
    var readingPercentString: String {
        
        if readingProgress == 1 {
            return "100%"
        } else {
            
            let value = readingProgress * 100
            
            return String(format: "%.2f", value) + "%"
        }
        
    }
}
