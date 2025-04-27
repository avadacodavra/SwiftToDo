import SwiftUI

struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    @State private var name = "John Doe"
    @State private var email = "john@example.com"
    @State private var dateOfBirth = Date()
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile Picture
                profileImage?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    .onTapGesture {
                        showingImagePicker = true
                    }

                // Profile Details
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                        DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                    }

                    Section {
                        Button(action: {
                            isLoggedIn = false
                        }) {
                            Text("Logout")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }
}
