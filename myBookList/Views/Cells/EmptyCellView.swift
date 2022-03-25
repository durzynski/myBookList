//
//  EmptyCellView.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation
import UIKit

class EmptyCellView: UIView {
    
    //MARK: - UI Elements
    
    private let emptyCellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let emptyCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        
        return imageView
    }()
    
    private let emptyCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    //MARK: - Init
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
    
        configureUI(imageName, title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: - Configure UI

extension EmptyCellView {
    
    func configureUI(_ imageName: String, _ title: String) {

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray5
        
        addSubview(emptyCellStackView)
        emptyCellStackView.addArrangedSubview(emptyCellImageView)
        emptyCellStackView.addArrangedSubview(emptyCellLabel)
        
        emptyCellImageView.image = UIImage(systemName: imageName)
        emptyCellLabel.text = title
        
        layoutUI()
    }
    
    func layoutUI() {
        
        NSLayoutConstraint.activate([
            
            emptyCellStackView.topAnchor.constraint(equalTo: topAnchor),
            emptyCellStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            emptyCellStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyCellStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            emptyCellImageView.heightAnchor.constraint(equalToConstant: 150),
            emptyCellImageView.widthAnchor.constraint(equalTo: emptyCellImageView.heightAnchor)
            
        ])
        
    }
    
}
