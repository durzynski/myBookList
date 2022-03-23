//
//  BookListViewController.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import UIKit

class BookListViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private let bookListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.register(BookListEmptyCell.self, forCellReuseIdentifier: BookListEmptyCell.identifier)
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
}

//MARK: - Setup UI

extension BookListViewController {
    
    private func configureUI() {

        view.backgroundColor = .systemGray5
        view.addSubview(bookListTableView)
        
        layoutUI()
        setupNavigation()
        setupTableView()
    }
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            
            bookListTableView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            bookListTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: bookListTableView.trailingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: bookListTableView.bottomAnchor, multiplier: 0),
            
        ])
    }

    private func setupNavigation() {
        
        title = "My Book List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddBookVC))
        
    }
    
    private func setupTableView() {
        bookListTableView.delegate = self
        bookListTableView.dataSource = self
    }
    
}

//MARK: - Actions

extension BookListViewController {
    
    @objc func presentAddBookVC() {
        
        let vc = AddBookViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

//MARK: - UITableViewDataSource & Delegate

extension BookListViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookListEmptyCell.identifier) as? BookListEmptyCell else {
            fatalError()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return bookListTableView.bounds.size.height - 100
    }
}


