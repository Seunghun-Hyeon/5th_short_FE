//
//  Todo.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//
import SwiftUI

struct Todo: Identifiable, Codable {
    let id: UUID
    var title: String
    var dueDate: Date
    var priority: Int
    var createdAt: Date
}

let mockTodos: [Todo] = [
    Todo(
        id: UUID(),
        title: "🧠 알고리즘 과제 2번 문제 풀기",
        dueDate: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!,
        priority: 1,
        createdAt: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
    ),
    Todo(
        id: UUID(),
        title: "📚 경제학 수업 리포트 초안 작성",
        dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
        priority: 2,
        createdAt: Calendar.current.date(byAdding: .hour, value: -3, to: Date())!
    ),
    Todo(
        id: UUID(),
        title: "🎨 UI디자인 과제 포스터 스케치",
        dueDate: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!,
        priority: 3,
        createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    ),
    Todo(
        id: UUID(),
        title: "📊 발표용 PPT 슬라이드 정리",
        dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
        priority: 2,
        createdAt: Calendar.current.date(byAdding: .hour, value: -10, to: Date())!
    ),
    Todo(
        id: UUID(),
        title: "📝 Flutter 앱 기능 테스트",
        dueDate: Calendar.current.date(byAdding: .hour, value: 4, to: Date())!,
        priority: 1,
        createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
    )
]
