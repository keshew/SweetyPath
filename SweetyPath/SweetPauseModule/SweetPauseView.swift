import SwiftUI
import SpriteKit
struct SweetPauseView: View {
    @StateObject var sweetPauseModel =  SweetPauseViewModel()
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
                                NavigationLink(destination: SweetMenuView()) {
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
                            .padding(.trailing, 20)
                          
                        }
                        
                        Text("PAUSE")
                            .Bowlby(size: 35)
                        
                        Spacer(minLength: 50)
                        
                        ZStack {
                            Image(.cloudBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.874,
                                       height: geometry.size.height * 0.422)
                            
                            VStack(spacing: 35) {
                                Text("Take a moment to breathe\nand relax. The world around\nyou is full of wonders\nwaiting to be discovered.\nEnjoy the break and come\nback refreshed!")
                                    .Bowlby(size: 18)
                                    .multilineTextAlignment(.center)
                            }
                            .offset(y: -geometry.size.height * 0.056)
                        }
                    }
                }
                
                Image(.woman2)
                    .resizable()
                    .frame(width: geometry.size.width * 0.78,
                           height: geometry.size.height * 0.44)
                    .position(x: geometry.size.width / 1.55, y: geometry.size.height / 1.15)
                
                Button(action: {
                    game.isPause = false
                    scene.isPaused = false
                }) {
                    ZStack {
                        Image(.wideBackButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.505,
                                   height: geometry.size.height * 0.095)
                        
                        Text("CONTINUE")
                            .Bowlby(size: 20)
                    }
                }
                .position(x: geometry.size.width / 3.3, y: geometry.size.height / 1.4)
                
                NavigationLink(destination: SweetMenuView()) {
                    ZStack {
                        Image(.wideBackButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.505,
                                   height: geometry.size.height * 0.095)
                        
                        Text("MENU")
                            .Bowlby(size: 20)
                    }
                }
                .position(x: geometry.size.width / 3.3, y: geometry.size.height / 1.22)
            }
        }
    }
}

#Preview {
    let gameData = SweetGameData()
    let scene = SKScene()
    return SweetPauseView(game: gameData, scene: scene)
}

