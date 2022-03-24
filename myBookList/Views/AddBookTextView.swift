//
//  AddBookTextView.swift
//  myBookList
//
//  Created by Damian Durzyński on 24/03/2022.
//

import Foundation
import UIKit

class AddBookTextView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textAlignment = .left
        
        return titleLabel
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 8
        textView.clipsToBounds = true
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.backgroundColor = .systemGray5
        
        return textView
    }()
    
    //MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
    
        setupUI(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: - Configure UI

extension AddBookTextView {
    
    private func setupUI(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textView)
        
        titleLabel.text = title
    
        layoutUI()
    }
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
}
