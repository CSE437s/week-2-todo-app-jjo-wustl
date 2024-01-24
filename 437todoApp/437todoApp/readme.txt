
Junyeong Jo (509291)

Features:
- create new to-do
- delete
- update/edit the name of the to-do
- Data is maintained between app launches (data saved locally): UserDefaults

Components:
- ToDoItem.swift: Model representing a task.
- ToDoStorage.swift: Handles data persistence.
- ContentView.swift: Main view showing the task list.
- TaskDetailView.swift: View for adding/editing tasks.

How to open the project:
- open 437todoApp.xcodeproj
- Run the app in the simulator (below is the tested version):
    - Minimum deployments: iOS 17.2
    - iphone 15 pro simulator

How to use the app:
- Tap the '+' button to add a new to-do.
- drag down the view to undo adding a new to-do
- Tap a task(to-do) in the list to edit.
- Swipe left on a task(to-do) to delete.
