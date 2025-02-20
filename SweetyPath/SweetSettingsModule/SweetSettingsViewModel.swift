import SwiftUI

class SweetSettingsViewModel: ObservableObject {
    let contact = SweetSettingsModel()
    @Published var isVibration = false
}
