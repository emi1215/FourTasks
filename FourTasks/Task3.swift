//
//  Task3.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//

import RealmSwift

class Task3: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id3 = 0

    // タイトル
    @objc dynamic var title3 = ""

    // 内容
    @objc dynamic var contents3 = ""

    // 日時
    @objc dynamic var date3 = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id3"
    }
}
