//
//  AddBookViewModel.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation

struct AddBookViewModel {
    
    var title: String = ""
    var author: String = ""
    var readPages: String = ""
    var allPages: String = ""
    var notes: String = ""
    
    func save() {
        
        let manager = CoreDataManager.shared
        
        let book = Book(context: manager.persistentContainer.viewContext)
        
        book.title = title
        book.author = author
        book.readPages = Int16(readPages) ?? 0
        book.allPages = Int16(allPages) ?? 0
        book.notes = notes
        
        manager.save()
        
    }
    
}
