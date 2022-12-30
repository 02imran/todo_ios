//
//  Task.swift
//  Todo-app
//
//  Created by md imran on 31/12/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var completed: Bool = false
}
