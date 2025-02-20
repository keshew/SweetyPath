import SwiftUI

class SweetRecipeViewModel: ObservableObject {
    let contact = SweetRecipeModel()
    let grid = [GridItem(.flexible(), spacing: -20),
                GridItem(.flexible(), spacing: -20),
                GridItem(.flexible(), spacing: -20)]
    @Published var userDefaults = UserDefaultsManager()
    
    init() {
           self.userDefaults = UserDefaultsManager()
           self.userDefaults.loadCollectionItems()
       }
}
