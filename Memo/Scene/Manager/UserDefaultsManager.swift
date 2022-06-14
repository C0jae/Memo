//
//  UserDefaultsManager.swift
//  Memo
//
//  Created by 최영재 on 2022/06/14.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getMemos() -> [Memo]
    func setMemo(_ newValue: Memo)
}

final class UserDefaltsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case memo   // 메모
        case memoId // 메모 아이디
    }
    
    func getMemos() -> [Memo] {
        guard let data = UserDefaults.standard.data(forKey: Key.memo.rawValue) else { return [] }
        return (try? PropertyListDecoder().decode([Memo].self, from: data)) ?? []
    }
    
    func setMemo(_ newValue: Memo) {
        var currentMomos: [Memo] = getMemos()
        currentMomos.insert(newValue, at: 0)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentMomos), forKey: Key.memo.rawValue)
    }
}
