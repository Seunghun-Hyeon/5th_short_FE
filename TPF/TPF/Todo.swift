//
//  Todo.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: UUID
    var subject: String
    var tasks: [String]
    var answers: [String]
    var createdAt: Date
}
