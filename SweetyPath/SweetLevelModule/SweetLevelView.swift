import SwiftUI

struct SweetLevelView: View {
    @StateObject var sweetLevelModel =  SweetLevelViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.levelBack)
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
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(.menu)
                                .resizable()
                                .frame(width: 62, height: 77)
                                .padding(.leading)
                        }
                        
                        Spacer()
                    }
                    
                    Text("LEVEL")
                        .Bowlby(size: geometry.size.width * 0.09)
                    
                    Spacer()
                }
                
                LevelPin(text: "1", geometry: geometry)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.04)
                
                LevelPin(text: "2", geometry: geometry)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.18)
                
                LevelPin(text: "3", geometry: geometry)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.36)
                
                LevelPin(text: "4", geometry: geometry)
                    .position(x: geometry.size.width / 1.45, y: geometry.size.height / 1.53)
                
                LevelPin(text: "5", geometry: geometry)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.75)
                
                LevelPin(text: "6", geometry: geometry)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2.2)
                
                LevelPin(text: "7", geometry: geometry)
                    .position(x: geometry.size.width / 4, y: geometry.size.height / 2.3)
                
                LevelPin(text: "8", geometry: geometry)
                    .position(x: geometry.size.width / 3.7, y: geometry.size.height / 3.2)
                
                LevelPin(text: "9", geometry: geometry)
                    .position(x: geometry.size.width / 2.3, y: geometry.size.height / 4.3)
                
                LevelPin(text: "10", geometry: geometry)
                    .position(x: geometry.size.width / 1.55, y: geometry.size.height / 4)
                
                LevelPin(text: "11", geometry: geometry)
                    .position(x: geometry.size.width / 1.28, y: geometry.size.height / 2.9)
                
                LevelPin(text: "12", geometry: geometry)
                    .position(x: geometry.size.width / 1.17, y: geometry.size.height / 2.2)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SweetLevelView()
}

