//
//  ListViewController.swift
//  Memo
//
//  Created by 최영재 on 2022/06/02.
//

import UIKit

class ListViewController: UIViewController {
    // 검색바
    private let searchBar: UISearchController = {
        let searchBar = UISearchController(searchResultsController: SearchResultsViewController())
        searchBar.searchBar.placeholder = "메모 검색"
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.searchBar.tintColor = .white
        return searchBar
    }()
    
    // 메모 리스트
    private let listTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private lazy var rightBarButton = UIBarButtonItem(
        image: UIImage(systemName: "square.and.pencil"),
        style: .done,
        target: self,
        action: #selector(rightBarButtonClick())
    )

    private func applyNavbar() {
        navigationItem.title = "메모 목록"
        navigationItem.rightBarButtonItem = rightBarButton
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listTable)
        
        navigationItem.searchController = searchBar
        
        applyNavbar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        listTable.frame = view.bounds
    }
}

extension ListViewController {
    @objc func rightBarButtonClick() {
        
    }
}
