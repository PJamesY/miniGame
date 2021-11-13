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
}
