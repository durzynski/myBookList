//
//  AddBookViewController.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation
import UIKit

class AddBookViewController: UIViewController {
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    override func loadView() {
        super.loadView()
        
        view = AddBookView()
    }
    
    
}

//MARK: - Configure UI

extension AddBookViewController {
    
    private func configureUI() {
        
        title = "Add new book"
        
        layoutUI()
        
    }
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
    
    private func configureNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        
    }
    
}
