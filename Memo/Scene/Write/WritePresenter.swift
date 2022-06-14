//
//  WritePresenter.swift
//  Memo
//
//  Created by 최영재 on 2022/06/14.
//

import Foundation
import UIKit

protocol WriteProtocol: AnyObject {
    func setNavigationBar()
}

final class WritePresenter: NSObject {
    private let viewController: WriteProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var isEditing: Bool
    private var memo: Memo
    
    init(
        viewController: WriteProtocol?,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManagerProtocol(),
        isEditing: Bool,
        memo: Memo
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
        self.isEditing = isEditing
        self.memo = memo
    }
    
    func viewDidLoad() {
        
    }
}
