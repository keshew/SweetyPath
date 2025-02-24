import SwiftUI

class SweetGameViewModel: ObservableObject {
    let contact = SweetGameModel()

    func createSweetGameScene(gameData: SweetGameData, level: Int) -> SweetGameSpriteKit {
        let scene = SweetGameSpriteKit(level: level)
        scene.game  = gameData
        return scene
    }
}
