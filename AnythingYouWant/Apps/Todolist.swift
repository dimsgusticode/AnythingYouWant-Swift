//
//  Todolist.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    var createdDate: Date = Date()
    var createdTime: Date = Date()
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func removeTask(atOffsets indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
        saveTasks()
    }
    
    func toggleTaskCompleted(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    private func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: "tasks")
        }
    }
    
    private func loadTasks() {
        if let encodedData = UserDefaults.standard.data(forKey: "tasks") {
            if let decodedTasks = try? JSONDecoder().decode([Task].self, from: encodedData) {
                tasks = decodedTasks
            }
        }
    }
}

struct Todolist: View {
    @StateObject var taskManager = TaskManager()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(taskManager.tasks) { task in
                        TaskRow(task: task)
                            .onTapGesture {
                                taskManager.toggleTaskCompleted(task: task)
                            }
                    }
                    .onDelete(perform: taskManager.removeTask)
                }
                
                HStack {
                    TextField("New task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addTask) {
                        Text("Add")
                    }
                }
                .padding()
            }
        }
    }
    
    func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        taskManager.addTask(title: newTaskTitle)
        newTaskTitle = ""
    }
}

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                Text(task.title)
                    .strikethrough(task.isCompleted)
            }
            Text("Created: \(formattedDate) at \(formattedTime)")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: task.createdDate)
    }
    
    private var formattedTime: String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        return timeFormatter.string(from: task.createdTime)
    }
}

struct Todolist_Previews: PreviewProvider {
    static var previews: some View {
        Todolist()
    }
}
