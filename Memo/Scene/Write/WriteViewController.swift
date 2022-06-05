//
//  WriteMemoViewController.swift
//  Memo
//
//  Created by 최영재 on 2022/06/04.
//

import UIKit

class WriteViewController: UIViewController {
    // 메모 작성 뷰
    private let textView: UITextView = {
        let textView = UITextView()
        textView.becomeFirstResponder()
        return textView
    }()
    
    // 왼쪽 바 버튼 : 목록으로 이동
    private let leftBarButton = UIBarButtonItem (
        image: UIImage(systemName: "arrow.left"),
        style: .done,
        target: self,
        action: #selector(clickLeftBarButton(_:))
    )
    
    // 오른쪽 바 버튼 : 잠금버튼
    private lazy var lockRightBarButton = UIBarButtonItem (
        image: UIImage(systemName: "lock"),
        style: .done,
        target: self,
        action: nil
    )
    
    // 오른쪽 바 버튼 : 작성 완료 버튼
    private lazy var saveRightBarButton = UIBarButtonItem (
        image: UIImage(systemName: "checkmark"),
        style: .done,
        target: self,
        action: nil
    )

    private func applyNavBar() {
        navigationItem.rightBarButtonItems = [
            saveRightBarButton ,lockRightBarButton
        ]
        
        navigationItem.leftBarButtonItem = leftBarButton
        
        navigationController?.navigationBar.tintColor = .red
    }
    
    private func applyTextView() {
        textView.tintColor = .white
        textView.font = .systemFont(ofSize: 20)
    }
    
    private func pushToListView() {
        let listView = ListViewController()
        navigationController?.pushViewController(listView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "메모 작성"
        
        view.addSubview(textView)
        
        applyNavBar()
        applyTextView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.frame = view.bounds
    }

}

extension WriteViewController {
    @objc func clickLeftBarButton(_ sender: Any) {
        pushToListView()
    }
}
