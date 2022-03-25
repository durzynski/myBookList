//
//  BookListCell.swift
//  myBookList
//
//  Created by Damian Durzyński on 24/03/2022.
//

import Foundation
import UIKit

class BookListCell: UITableViewCell {
    
    static let identifier = String(describing: BookListCell.self)
    static let preferredHeight = CGFloat(100)
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        
        return stackView
    }()
    
    private let labelStackView = CustomStackView(_axis: .vertical, _spacing: 8)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    private let progressStackView = CustomStackView(_axis: .vertical, _spacing: 8, _alignment: .center)
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .gray
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
    
    private let chevronImageView = ChevronImageView(frame: .zero)
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemGray5
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: - ConfigureUI

extension BookListCell {
    
    private func setupUI() {
     
        contentView.addSubview(mainContainer)
        mainContainer.addSubview(mainStackView)
        mainStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(authorLabel)
        mainStackView.addArrangedSubview(progressStackView)
        progressStackView.addArrangedSubview(progressLabel)
        progressStackView.addArrangedSubview(progressBar)
        mainContainer.addSubview(chevronImageView)
        
        layoutUI()
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            
            mainContainer.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            mainContainer.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: mainContainer.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: mainContainer.bottomAnchor, multiplier: 1),
            
            mainStackView.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: mainContainer.leadingAnchor, multiplier: 2),
            chevronImageView.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 3),
            
            progressBar.widthAnchor.constraint(equalToConstant: 75),
            
            chevronImageView.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            mainContainer.trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 2),
        ])
    }
    
    func configure(with viewModel: BookViewModel) {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        
        if viewModel.numberOfPages != 0 {
            progressBar.setProgress(viewModel.readingProgress, animated: false)
            progressLabel.text = viewModel.readingPercentString

        } else {
            progressLabel.text = ""
            progressBar.setProgress(0, animated: false)
        }
    }
}
