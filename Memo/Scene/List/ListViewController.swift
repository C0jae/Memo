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
        return searchBar
    }()
    
    // 메모 리스트
    private let listTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // 메모작성 버튼 생성
    private lazy var rightBarButton = UIBarButtonItem(
        image: UIImage(systemName: "square.and.pencil"),
        style: .done,
        target: self,
        action: #selector(rightBarButtonClick(_:))
    )

    // 네비게이션바 생성 및 구성
    private func applyNavbar() {
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // 메모 작성화면 보여주기
    private func pushToWriteViewController() {
        let writeViewController = WriteViewController()
        navigationController?.pushViewController(writeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "메모 목록"
        
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
    // 메모작성버튼 클릭 -> 작성화면으로 이동하기
    @objc func rightBarButtonClick(_ sender: Any) {
        pushToWriteViewController()
    }
}
