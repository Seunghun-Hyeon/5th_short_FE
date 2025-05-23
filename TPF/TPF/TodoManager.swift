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
        var todos = loadTodos() // 기존 리스트
        todos.append(todo)      // 새로운 Todo 추가

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todos) {
            UserDefaults.standard.set(encoded, forKey: todoKey)
        }
    }


    static func loadTodos() -> [Todo] {
        let decoder = JSONDecoder()
        if let saved = UserDefaults.standard.data(forKey: todoKey),
           let decoded = try? decoder.decode([Todo].self, from: saved) {
            return decoded
        }
        return []
    }


    static func deleteTodo() {
        UserDefaults.standard.removeObject(forKey: todoKey)
    }
}
