import SwiftUI

class SweetLoadingViewModel: ObservableObject {
    let contact = SweetLoadingModel()
    @Published var currentIndex = 0
    @Published var isMenu = false
}
