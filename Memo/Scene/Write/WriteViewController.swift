//
//  WriteMemoViewController.swift
//  Memo
//
//  Created by 최영재 on 2022/06/04.
//

import UIKit

class WriteViewController: UIViewController {
    private var presenter: WritePresenter
    
    init(isEditing: Bool, memo: Memo) {
        super.init(nibName: nil, bundle: nil)
        presenter = WritePresenter(viewController: self, isEditing: isEditing, memo: memo)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        target: nil,
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

    // 텍스트 뷰 구성
    private func applyTextView() {
        textView.tintColor = .white
        textView.font = .systemFont(ofSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension WriteViewController: WriteProtocol {
    func setNavigationBar() {
        title = "메모 작성"
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [saveRightBarButton, lockRightBarButton]
    }
    
    @objc func clickLeftBarButton(_ sender: Any) {
    }
    
    @objc func didTappedSaveRightBarButton() {
        
    }
}
