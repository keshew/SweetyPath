import SwiftUI

@main
struct SweetyPathApp: App {
    var body: some Scene {
        WindowGroup {
            SweetLoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
