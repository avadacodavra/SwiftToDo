import Foundation

enum Priority: String, CaseIterable, Identifiable {
    case low, medium, high
    var id: String { self.rawValue }
    
    var color: String {
        switch self {
        case .low: return "Green"
        case .medium: return "Orange"
        case .high: return "Red"
        }
    }
}

struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var priority: Priority
    var isCompleted: Bool = false
}
