import SwiftUI

class SweetMenuViewModel: ObservableObject {
    let contact = SweetMenuModel()
    @Published var isSettings = false
}
