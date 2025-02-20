import SwiftUI

struct SweetLoseView: View {
    @StateObject var sweetLoseModel =  SweetLoseViewModel()
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
                        
                        Text("GAME OVER!")
                            .Bowlby(size: 35)
                        
                        Spacer(minLength: 50)
                        
                        ZStack {
                            Image(.cloudBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.874,
                                       height: geometry.size.height * 0.422)
                            
                            VStack(spacing: 35) {
                                VStack(spacing: 15) {
                                    Text("NICE TRY!")
                                        .Bowlby(size: 25, outlineWidth: 0.5)
                                    
                                    Text("YOU DIDN'T SAVED LIFE!")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                }
                                HStack {
                                    Text("YOUR LOSSES:")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                    
                                    Text("30")
                                        .Bowlby(size: 20, outlineWidth: 0.5)
                                    
                                    Image(.money)
                                        .resizable()
                                        .frame(width: 37, height: 37)
                                }
                                
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
                
                NavigationLink(destination: SweetGameView()) {
                    ZStack {
                        Image(.wideBackButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.505,
                                   height: geometry.size.height * 0.095)
                        
                        Text("RETRY")
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
            
            .onAppear {
                audioManager.stopMenuMusic()
                audioManager.playLoseMusic()
            }
            
            .onDisappear {
                audioManager.stopLoseMusic()
                audioManager.playMenuMusic()
            }
        }
    }
}

#Preview {
    SweetLoseView()
}

