//
//  ToDoStorage.swift
//  437todoApp
//
//  Created by Junyeong Jo on 1/23/24.
//

import Foundation
import Combine

class ToDoStorage: ObservableObject {
    @Published var tasks: [ToDoItem] = []

    init() {
        loadTasks()
    }

    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([ToDoItem].self, from: data) {
            self.tasks = savedTasks
        }
    }

    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    func addTask(_ task: ToDoItem) {
        tasks.append(task)
        saveTasks()
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    func updateTask(_ task: ToDoItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            saveTasks()
        }
    }
}
