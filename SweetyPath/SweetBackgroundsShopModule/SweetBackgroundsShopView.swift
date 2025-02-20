import SwiftUI

struct SweetBackgroundsShopView: View {
    @StateObject var sweetBackgroundsShopModel =  SweetBackgroundsShopViewModel()
    @Environment(\.presentationMode) var presentationMode
    
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
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(.menu)
                                        .resizable()
                                        .frame(width: 62, height: 77)
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
                        
                        Spacer(minLength: 20)
                        
                        VStack(spacing: -10) {
                            Text("SHOP")
                                .Bowlby(size: 35)
                            
                            Text("Backgrounds")
                                .Bowlby(size: 20, outlineWidth: 0.6)
                        }
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 50) {
                            HStack(spacing: 20) {
                                if UserDefaultsManager().containsImage(named: "castleBG") {
                                    EquipedBGItem(geometry: geometry,
                                                  image: SweetImageName.bg1.rawValue,
                                                  text: "CASTLE")
                                } else {
                                    ShopBackgroundItem(geometry: geometry,
                                                       image: SweetImageName.bg1.rawValue,
                                                       text: "CASTLE") {
                                        UserDefaultsManager().addImage("castleBG")
                                        sweetBackgroundsShopModel.again = 1
                                    }
                                }
                                
                                if UserDefaultsManager().containsImage(named: "roadBG") {
                                    EquipedBGItem(geometry: geometry,
                                                  image: SweetImageName.bg2.rawValue,
                                                  text: "ROAD")
                                } else {
                                    ShopBackgroundItem(geometry: geometry,
                                                       image: SweetImageName.bg2.rawValue,
                                                       text: "ROAD") {
                                        UserDefaultsManager().addImage("roadBG")
                                        sweetBackgroundsShopModel.again = 1
                                    }
                                }
                            }
                            
                            HStack(spacing: 20) {
                                if UserDefaultsManager().containsImage(named: "villageBG") {
                                    EquipedBGItem(geometry: geometry,
                                                  image: SweetImageName.bg3.rawValue,
                                                  text: "VILLAGE")
                                } else {
                                    ShopBackgroundItem(geometry: geometry,
                                                       image: SweetImageName.bg3.rawValue,
                                                       text: "VILLAGE") {
                                        UserDefaultsManager().addImage("villageBG")
                                        sweetBackgroundsShopModel.again = 1
                                    }
                                }
                                
                                if UserDefaultsManager().containsImage(named: "houseBG") {
                                    EquipedBGItem(geometry: geometry,
                                                  image: SweetImageName.bg4.rawValue,
                                                  text: "HOUSE")
                                } else {
                                    ShopBackgroundItem(geometry: geometry,
                                                       image: SweetImageName.bg4.rawValue,
                                                       text: "HOUSE") {
                                        UserDefaultsManager().addImage("houseBG")
                                        sweetBackgroundsShopModel.again = 1
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SweetBackgroundsShopView()
}

