import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []

    var activeTasks: [TaskItem] {
        tasks.filter { !$0.isCompleted }
    }

    var completedTasks: [TaskItem] {
        tasks.filter { $0.isCompleted }
    }

    func addTask(_ task: TaskItem) {
        tasks.append(task)
    }

    func toggleComplete(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
