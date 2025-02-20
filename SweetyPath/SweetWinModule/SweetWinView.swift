import SwiftUI

struct SweetWinView: View {
    @StateObject var sweetWinModel =  SweetWinViewModel()
    @ObservedObject var audioManager = AudioManager.shared
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
                            .padding(.trailing)
                        }
                        
                        Text("VICTORY")
                            .Bowlby(size: 35)
                        
                        Spacer(minLength: 50)
                        
                        ZStack {
                            Image(.cloudBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.874,
                                       height: geometry.size.height * 0.422)
                            
                            VStack {
                                VStack(spacing: 0) {
                                    Text("CONGRATULATION!")
                                        .Bowlby(size: 25, outlineWidth: 0.5)
                                    
                                    Text("YOUR WINNINGS:")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                }
                                HStack {
                                    Text("30")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                    
                                    Image(.money)
                                        .resizable()
                                        .frame(width: 37, height: 37)
                                }
                                
                                VStack(spacing: 5) {
                                    Text("NEW RECIPE!")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                    
                                    Image(UserDefaultsManager().getRandomAndOpenItem()!.image)
                                        .resizable()
                                        .frame(width: 68, height: 63)
                                }
                            }
                            .offset(y: -geometry.size.height * 0.056)
                        }
                    }
                }
                
                Image(.woman)
                    .resizable()
                    .frame(width: geometry.size.width * 0.848,
                           height: geometry.size.height * 0.44)
                    .position(x: geometry.size.width / 1.5, y: geometry.size.height / 1.15)
                
                if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 12 {
                    NavigationLink(destination: SweetGameView()) {
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
                } else {
                    
                }
                
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
            
            .onAppear {
                audioManager.stopMenuMusic()
                audioManager.playWinMusic()
            }
            
            .onDisappear {
                audioManager.stopWinMusic()
                audioManager.playMenuMusic()
            }
        }
    }
}

#Preview {
    SweetWinView()
}

