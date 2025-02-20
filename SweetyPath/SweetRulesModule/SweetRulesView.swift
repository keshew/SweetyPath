import SwiftUI
import SpriteKit

struct SweetRulesView: View {
    @StateObject var sweetRulesModel =  SweetRulesViewModel()
    var game: SweetGameData
    var scene: SKScene
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            VStack {
                                Button(action: {
                                    game.isRules = false
                                    scene.isPaused = false
                                }) {
                                    Image(.menu)
                                        .resizable()
                                        .frame(width: 62, height: 77)
                                }
                                .padding(.leading, 18)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 20) {
                                ZStack {
                                    Image(.smallBackButton)
                                        .resizable()
                                        .frame(width: 132, height: 57)
                                    
                                    Image(.money)
                                        .resizable()
                                        .frame(width: 54, height: 54)
                                        .offset(x: -50)
                                    
                                    Text("\(UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 0)")
                                        .Bowlby(size: 23)
                                        .offset(x: 13)
                                }
                                
                                ZStack {
                                    Image(.smallBackButton)
                                        .resizable()
                                        .frame(width: 132, height: 57)
                                    
                                    Image(.heart)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .offset(x: -40)
                                    
                                    Text("\(UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 0)")
                                        .Bowlby(size: 23)
                                        .offset(x: 16)
                                }
                            }
                            .padding(.trailing)
                        }
                        
                        Text("RULES")
                            .Bowlby(size: 35)
                        
                        Spacer(minLength: 50)
                        
                        ZStack {
                            Image(.cloudBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.874,
                                       height: geometry.size.height * 0.422)
                            
                            Text("The colored squares on the playing field\nhave different numerical values.\nThis number means how many cells you\ncan fill with the appropriate color. Move\nfrom the colored square to the free\nsquares in any direction. until the\nnumber changes to 0.\nFill in all the available cells so that the\nlines do not intersect, and thus complete\nthe level.")
                                .Bowlby(size: 12, outlineWidth: 0.5)
                                .multilineTextAlignment(.center)
                                .offset(y: -35)
                        }
                    }
                }
                
                Image(.woman)
                    .resizable()
                    .frame(width: geometry.size.width * 0.848,
                           height: geometry.size.height * 0.44)
                    .position(x: geometry.size.width / 1.5, y: geometry.size.height / 1.15)
            }
        }
    }
}

#Preview {
    let gameData = SweetGameData()
    let scene = SKScene()
    return SweetRulesView(game: gameData, scene: scene)
}

