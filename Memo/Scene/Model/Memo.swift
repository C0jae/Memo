//
//  Memo.swift
//  Memo
//
//  Created by 최영재 on 2022/06/14.
//

import Foundation

struct Memo: Codable {
    let id: Int
    let content: String
    let password: String
    let isSecret: Bool
    
    init(
        id: Int,
        content: String,
        password: String,
        isSecret: Bool
    ) {
        self.id = id
        self.content = content
        self.password = password
        self.isSecret = isSecret
    }
}

extension Memo {
    static let EMPTY = Memo(id: -1, content: "", password: "", isSecret: false)
    static let TEST = Memo(id: 0, content: "테스트", password: "0000", isSecret: true)
}
