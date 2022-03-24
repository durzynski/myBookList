//
//  AddBookView.swift
//  myBookList
//
//  Created by Damian Durzyński on 23/03/2022.
//

import Foundation
import UIKit

class AddBookView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    let titleView = AddBookTextField(title: "Book Title")
   
    let authorView = AddBookTextField(title: "Author")
    
    private let pagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let numberOfPagesReadView = AddBookTextField(title: "Read Pages", keyboardType: .numberPad)
    
    let numberOfPagesView = AddBookTextField(title: "All Pages", keyboardType: .numberPad)
    
    let notesView = AddBookTextView(title: "Notes")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: - Configure UI

extension AddBookView {
    
    private func setupUI() {
        
        addSubview(stackView)
        backgroundColor = .systemGray5
        
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(authorView)
        stackView.addArrangedSubview(pagesStackView)
        pagesStackView.addArrangedSubview(numberOfPagesReadView)
        pagesStackView.addArrangedSubview(numberOfPagesView)
        stackView.addArrangedSubview(notesView)
        
        layoutUI()
    }
    
    private func layoutUI() {
     
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
        ])
        
    }
    
    private func setupDelegates() {
        
       titleView.textField.delegate = self
       authorView.textField.delegate = self
       numberOfPagesReadView.textField.delegate = self
       numberOfPagesView.textField.delegate = self
    }
}

//MARK: - TextField Delegate

extension AddBookView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {

        case titleView.textField:
            authorView.textField.becomeFirstResponder()
        case authorView.textField:
            numberOfPagesReadView.textField.becomeFirstResponder()
        case numberOfPagesReadView.textField:
            numberOfPagesView.textField.becomeFirstResponder()
        case numberOfPagesView.textField:
            notesView.textView.becomeFirstResponder()
        default:
            print("Error with return button.")

        }

        return true
    }
    
}
