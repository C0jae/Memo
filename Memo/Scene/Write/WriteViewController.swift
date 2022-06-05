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
        action: nil)

    private func applyNavBar() {
        navigationItem.rightBarButtonItems = [
            lockRightBarButton, saveRightBarButton
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(textView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        title = "메모 작성"
        
        textView.frame = view.bounds
    }

}
