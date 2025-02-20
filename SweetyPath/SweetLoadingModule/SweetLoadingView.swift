import SwiftUI

struct SweetLoadingView: View {
    @StateObject var sweetLoadingModel =  SweetLoadingViewModel()
    @ObservedObject var audioManager = AudioManager.shared
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.shadowTop)
                        .resizable()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height * 0.339)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 11)
                    
                    Image(.shadowToBack)
                        .resizable()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height * 0.339)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.07)
                    
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(.white)
                                .opacity(0.8)
                                .frame(width: geometry.size.width * 0.72,
                                       height: 16)
                                .cornerRadius(10)
                            
                            Rectangle()
                                .fill(LinearGradient(colors: [ Color(red: 249/255, green: 1/255, blue: 225/255),
                                                               Color(red: 138/255, green: 0/255, blue: 156/255)],
                                                     startPoint: .leading,
                                                     endPoint: .trailing))
                                .opacity(0.8)
                                .frame(width: geometry.size.width * sweetLoadingModel.contact.arraySize[sweetLoadingModel.currentIndex], height: 10)
                                .cornerRadius(10)
                                .offset(x: geometry.size.width * sweetLoadingModel.contact.arrayOffset[sweetLoadingModel.currentIndex])
                        }
                        .padding(.bottom)
                    }
                }
                
                .onAppear {
                    audioManager.playMenuMusic()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        sweetLoadingModel.currentIndex += 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        sweetLoadingModel.currentIndex += 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        sweetLoadingModel.isMenu = true
                    }
                }
                
                NavigationLink(destination: SweetMenuView(),
                               isActive: $sweetLoadingModel.isMenu) {}
                .hidden()
            }
        }
    }
}

#Preview {
    SweetLoadingView()
}

