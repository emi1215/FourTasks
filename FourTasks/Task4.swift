//
//  Task4.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/24.
//
import RealmSwift

class Task4: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id4 = 0

    // タイトル
    @objc dynamic var title4 = ""

    // 内容
    @objc dynamic var contents4 = ""

    // 日時
    @objc dynamic var date4 = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id4"
    }
}
