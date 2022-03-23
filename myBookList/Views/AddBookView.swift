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
    
    private let titleView = LabelWithTextFieldView(title: "Book Title")
   
    private let authorView = LabelWithTextFieldView(title: "Author")
    
    private let numberOfPagesView = LabelWithTextFieldView(title: "Number of pages", keyboardType: .numberPad)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        
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
        stackView.addArrangedSubview(numberOfPagesView)
        
        layoutUI()
    }
    
    private func layoutUI() {
     
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            
        ])
        
    }
}
