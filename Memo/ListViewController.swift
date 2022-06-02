//
//  ListViewController.swift
//  Memo
//
//  Created by 최영재 on 2022/06/02.
//

import UIKit

class ListViewController: UIViewController {
    private let listView: UITableView = {
        let listView = UITableView(frame: .zero, style: .grouped)
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return listView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listView)
        
        listView.delegate = self
        listView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        listView.frame = view.bounds
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello world"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
}
