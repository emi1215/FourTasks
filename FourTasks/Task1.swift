//
//  Task.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import RealmSwift

class Task1: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id1 = 0

    // タイトル
    @objc dynamic var title1 = ""

    // 内容
    @objc dynamic var contents1 = ""

    // 日時
    @objc dynamic var date1 = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id1"
    }
}
