//
//  BookListEmptyCell.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import Foundation
import UIKit

class BookListEmptyCell: UITableViewCell {
    
    static let identifier = String(describing: BookListEmptyCell.self)

    private let emptyCellView = EmptyCellView(imageName: K.EmptyCell.imageName, title: K.EmptyCell.title)
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: - Setup UI

extension BookListEmptyCell {
    
    private func configureUI() {
        
        contentView.addSubview(emptyCellView)
        contentView.backgroundColor = .systemGray5
        layoutUI()
    }
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            emptyCellView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyCellView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
