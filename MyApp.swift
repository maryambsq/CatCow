import SwiftUI

@main
struct MyApp: App {
    init() {
        UINavigationBar.appearance().tintColor = .black
    }

    @State private var reloadApp = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(hex: "E4E6EA")
                    .ignoresSafeArea()
                if reloadApp {
                    homepage()
                } else {
                    splashscreen()
                }
            }
        }
        .onChange(of: reloadApp) { _ in
            print("App is reloading!") 
        }
    }
}
