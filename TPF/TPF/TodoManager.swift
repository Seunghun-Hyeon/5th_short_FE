//
//  TodoManager.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import Foundation

struct TodoManager {
    static let todoKey = "savedTodo"

    static func saveTodo(_ todo: Todo) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todo) {
            UserDefaults.standard.set(encoded, forKey: todoKey)
        }
    }

    static func loadTodo() -> Todo? {
        let decoder = JSONDecoder()
        if let saved = UserDefaults.standard.data(forKey: todoKey),
           let decoded = try? decoder.decode(Todo.self, from: saved) {
            return decoded
        }
        return nil
    }

    static func deleteTodo() {
        UserDefaults.standard.removeObject(forKey: todoKey)
    }
}
