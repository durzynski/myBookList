//
//  LabelWithTextFieldView.swift
//  myBookList
//
//  Created by Damian Durzyński on 23/03/2022.
//

import Foundation
import UIKit

class AddBookTextField: UIView {
    
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
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.returnKeyType = .next
        
        return textField
    }()
    
    //MARK: - Init
    
    init(title: String, keyboardType: UIKeyboardType? = .default) {
        super.init(frame: .zero)
    
        setupUI(title: title, keyboardType: keyboardType ?? .default)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: - Configure UI

extension AddBookTextField {
    
    private func setupUI(title: String, keyboardType: UIKeyboardType) {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
        
        titleLabel.text = title
        textField.placeholder = title
        textField.keyboardType = keyboardType
    
        layoutUI()
    }
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
}
