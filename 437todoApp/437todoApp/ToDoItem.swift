//
//  ToDoItem.swift
//  437todoApp
//
//  Created by Junyeong Jo on 1/23/24.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
