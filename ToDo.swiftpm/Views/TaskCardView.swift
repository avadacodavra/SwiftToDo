import SwiftUI

struct TaskCardView: View {
    var task: TaskItem
    var onToggle: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                    .foregroundColor(task.isCompleted ? .green : .primary)
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(task.title)
                        .font(.headline)

                    Spacer()

                    Circle()
                        .fill(priorityColor(for: task.priority))
                        .frame(width: 10, height: 10)
                }

                Text(task.description)
                    .font(.subheadline)

                Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }

    func priorityColor(for priority: Priority) -> Color {
        switch priority {
        case .low:
            return .yellow
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
}
