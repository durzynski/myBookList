//
//  CoreDataManager.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BookModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load CoreData. \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save. \(error.localizedDescription)")
        }
    }
    
    func fetchData() -> [Book] {
        
        let request: NSFetchRequest<Book> = Book.fetchRequest()
        
        let titleSort = NSSortDescriptor(key: "title", ascending: true)
        let authorSort = NSSortDescriptor(key: "author", ascending: true)
        
        request.sortDescriptors = [titleSort, authorSort]
        
        do {
            return try persistentContainer.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func delete(book: Book) {
        
        persistentContainer.viewContext.delete(book)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete. \(error.localizedDescription)")
        }
    }
    
    
    
}
