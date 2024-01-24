//
//  TaskDetailView.swift
//  437todoApp
//
//  Created by Junyeong Jo on 1/23/24.
//

import SwiftUI

struct TaskDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var storage: ToDoStorage
    var task: ToDoItem?
    
    @State private var title: String = ""

    init(task: ToDoItem? = nil, storage: ToDoStorage) {
        self.task = task
        self._storage = ObservedObject(wrappedValue: storage)
        if let task = task {
            _title = State(initialValue: task.title)
        }
    }

    var body: some View {
        Form {
            TextField("Task Title", text: $title)
            Button(task == nil ? "Add" : "Update") {
                let taskItem = ToDoItem(id: task?.id ?? UUID(), title: title)
                if task == nil {
                    storage.addTask(taskItem)
                } else {
                    storage.updateTask(taskItem)
                }
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle(task == nil ? "New Task" : "Edit Task")
    }
}


struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = ToDoStorage()
        let sampleTask = ToDoItem(title: "Sample Task")
        TaskDetailView(task: sampleTask, storage: storage)
    }
}


//#Preview {
//    TaskDetailView()
//}
