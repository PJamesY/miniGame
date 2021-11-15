//
//  MemoStore.swift
//  miniGame
//
//  Created by james on 2021/11/13.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    // dummy data
    init() {
        list = [
            Memo(content: "Lorem Ipsum 1"),
            Memo(content: "Lorem Ipsum 2"),
            Memo(content: "Lorem Ipsum 3")
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else { return }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        self.list.removeAll { $0 == memo }
    }
}
