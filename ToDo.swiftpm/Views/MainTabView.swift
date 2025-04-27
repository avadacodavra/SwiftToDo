import SwiftUI

struct MainTabView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Tasks", systemImage: "checkmark.circle")
                }

            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
