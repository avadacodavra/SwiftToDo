import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = TaskViewModel()
    @State private var showAddSheet = false
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            VStack {
                Picker("Tabs", selection: $selectedTab) {
                    Text("Active").tag(0)
                    Text("Completed").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(selectedTab == 0 ? viewModel.activeTasks : viewModel.completedTasks) { task in
                        TaskCardView(task: task) {
                            viewModel.toggleComplete(task)
                        }
                    }
                }
            }
            .navigationTitle("To-Do")
            .toolbar {
                Button(action: {
                    showAddSheet.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddTaskView(viewModel: viewModel)
        }
    }
}
