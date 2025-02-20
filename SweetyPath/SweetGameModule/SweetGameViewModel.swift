import SwiftUI

class SweetGameViewModel: ObservableObject {
    let contact = SweetGameModel()

    func createSweetGameScene(gameData: SweetGameData) -> SweetGameSpriteKit {
        let scene = SweetGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
