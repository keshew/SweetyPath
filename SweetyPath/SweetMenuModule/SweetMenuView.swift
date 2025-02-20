import SwiftUI

struct SweetMenuView: View {
    @StateObject var sweetMenuModel =  SweetMenuViewModel()

    var body: some View {
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
              
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            VStack {
                                Button(action: {
                                    sweetMenuModel.isSettings = true
                                }) {
                                    Image(.settings)
                                        .resizable()
                                        .frame(width: 82, height: 72)
                                        
                                }
                                .padding(.leading)
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
                                    
                                    Text("\(UserDefaultsManager.defaults.integer(forKey: Keys.money.rawValue))")
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
                                    
                                    Text("\(UserDefaultsManager.defaults.integer(forKey: Keys.lifes.rawValue))")
                                        .Bowlby(size: 23)
                                        .offset(x: 16)
                                }
                            }
                            .padding(.trailing)
                        }
                        
                        Spacer(minLength: 20)
                        
                        Text("SWEETY PATH")
                            .Bowlby(size: 35)
                        
                        Spacer(minLength: 10)
                        
                        ZStack {
                            Image(.woman)
                                .resizable()
                                .frame(width: geometry.size.width * 0.713,
                                       height: geometry.size.height * 0.37)
                                
                            NavigationLink(destination: SweetLevelView()) {
                                ZStack {
                                    Image(.wideBackButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.763,
                                               height: geometry.size.height * 0.132)
                                    
                                    Text("PLAY")
                                        .Bowlby(size: 35)
                                }
                            }
                            .offset(y: geometry.size.height * 0.238)
                        }
                        
                        
                        Spacer(minLength: geometry.size.height * 0.145)
                        
                        HStack(spacing: 20) {
                            NavigationLink(destination: SweetRecipeView()) {
                                ZStack {
                                    Image(.wideBackButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.446,
                                               height: geometry.size.height * 0.086)
                                    
                                    Text("RECIPE")
                                        .Bowlby(size: 20)
                                }
                            }
                            
                            NavigationLink(destination: SweetShopView()) {
                                ZStack {
                                    Image(.wideBackButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.446,
                                               height: geometry.size.height * 0.086)
                                    
                                    Text("SHOP")
                                        .Bowlby(size: 20)
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                }
                
                if sweetMenuModel.isSettings {
                    SweetSettingsView(isSetting: $sweetMenuModel.isSettings)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SweetMenuView()
}

