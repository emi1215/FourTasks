//
//  Task2.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import RealmSwift

class Task2: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id2 = 0

    // タイトル
    @objc dynamic var title2 = ""

    // 内容
    @objc dynamic var contents2 = ""

    // 日時
    @objc dynamic var date2 = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id2"
    }
}
