//
//  ListViewController.swift
//  Memo
//
//  Created by 최영재 on 2022/06/02.
//

import UIKit

class MainViewController: UIViewController {
    // 검색바
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultsViewController())
        controller.searchBar.placeholder = "검색"
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.tintColor = .white
        return controller
    }()
    
    // 메모 리스트
    private let listTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private func applyNavbar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem.init(title: "편집", style: .done, target: self, action: nil),
            UIBarButtonItem.init(image: UIImage(systemName: "square.and.pencil"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .yellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "폴더"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(listTable)
        
        navigationItem.searchController = searchController
        
        applyNavbar()
        
        listTable.delegate = self
        listTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        listTable.frame = view.bounds
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Memo"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
}
