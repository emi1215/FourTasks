//
//  View.swift
//  FourTasks
//
//  Created by 横田瑛美 on 2022/03/25.
//

import RealmSwift

class Task: Object {
    // カテゴリー１
    @objc dynamic var category1 = ""

    //カテゴリー２
    @objc dynamic var category2 = ""

    // カテゴリー３
    @objc dynamic var category3 = ""
    
    //カテゴリー４
    @objc dynamic var category4 = ""
}
