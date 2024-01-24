//
//  ContentView.swift
//  437todoApp
//
//  Created by Junyeong Jo on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var storage = ToDoStorage()
    @State private var showingDetail = false

    var body: some View {
        NavigationView {
            List {
                ForEach(storage.tasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task, storage: storage)) {
                        Text(task.title)
                    }
                }
                .onDelete(perform: storage.deleteTask)
            }
            .navigationBarTitle("ToDo List")
            .navigationBarItems(trailing: Button(action: {
                self.showingDetail = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingDetail) {
                TaskDetailView(storage: storage)
            }
        }
    }
}


#Preview {
    ContentView()
}
