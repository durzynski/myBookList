//
//  BookListViewController.swift
//  myBookList
//
//  Created by Damian Durzyński on 22/03/2022.
//

import UIKit

class BookListViewController: UIViewController {
        
    private var bookListViewModel = BookListViewModel()
    
    //MARK: - UI Elements
    
    private let bookListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.register(BookListEmptyCell.self, forCellReuseIdentifier: BookListEmptyCell.identifier)
        tableView.register(BookListCell.self, forCellReuseIdentifier: BookListCell.identifier)
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        bookListViewModel.getBooks()
        
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
        
        title = K.bookListVcTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddBookVC))
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray5
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
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
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

//MARK: - UITableViewDataSource & Delegate

extension BookListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if bookListViewModel.books.count < 1 {
            return 1
        }
        
        return bookListViewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if bookListViewModel.books.count < 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookListEmptyCell.identifier) as? BookListEmptyCell else {
                fatalError()
            }
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.identifier, for: indexPath) as? BookListCell else {
            fatalError()
        }
        
        let viewModel = bookListViewModel.books[indexPath.row]
        cell.configure(with: viewModel)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if bookListViewModel.books.count < 1 {
            return bookListTableView.bounds.size.height - 100
            
        }
        
        return BookListCell.preferredHeight
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if bookListViewModel.books.count < 1 {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = bookListViewModel.books[indexPath.row]
        
        let vc = BookDetailViewController(viewModel: viewModel)
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let viewModel = bookListViewModel.books[indexPath.row]
            bookListViewModel.deleteBook(viewModel: viewModel)
            
            DispatchQueue.main.async {
                self.bookListViewModel.getBooks()
                self.bookListTableView.reloadData()
            }
        }
    }
}

//MARK: - AddBookVC Delegate

extension BookListViewController: AddBookViewControllerDelegate {
    func didAddBook() {
        DispatchQueue.main.async {
            self.bookListViewModel.getBooks()
            self.bookListTableView.reloadData()
        }
    }
}

//MARK: - DetailBookVC Delegate

extension BookListViewController: BookDetailViewControllerDelegate {
    func didEditBook() {
        DispatchQueue.main.async {
            self.bookListViewModel.getBooks()
            self.bookListTableView.reloadData()
        }
    }
}
