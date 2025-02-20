import SwiftUI

struct SweetHeartsShopView: View {
    @StateObject var sweetHeartsShopModel =  SweetHeartsShopViewModel()
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
                            
                            Text("Hearts")
                                .Bowlby(size: 20, outlineWidth: 0.6)
                        }
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 50) {
                            HStack(spacing: 20) {
                                ShopBackgroundItem(geometry: geometry,
                                                   image: SweetImageName.heart.rawValue,
                                                   text: "X 1",
                                                   sizeW: 0.286,
                                                   sizeH: 0.161) {
                                    UserDefaultsManager().updateResource(keyToUpdate: Keys.lifes, costInMoney: 30, countOfResourse: 1)
                                    sweetHeartsShopModel.again = 1
                                }
                                
                                ShopBackgroundItem(geometry: geometry,
                                                   image: SweetImageName.heart.rawValue,
                                                   text: "X 2",
                                                   sizeW: 0.286,
                                                   sizeH: 0.161,
                                                   cost: "60") {
                                    UserDefaultsManager().updateResource(keyToUpdate: Keys.lifes, costInMoney: 60, countOfResourse: 2)
                                    sweetHeartsShopModel.again = 1
                                }
                            }
                            
                            HStack(spacing: 20) {
                                ShopBackgroundItem(geometry: geometry,
                                                   image: SweetImageName.heart.rawValue,
                                                   text: "X 3",
                                                   sizeW: 0.286,
                                                   sizeH: 0.161,
                                                   cost: "90") {
                                    UserDefaultsManager().updateResource(keyToUpdate: Keys.lifes, costInMoney: 90, countOfResourse: 3)
                                    sweetHeartsShopModel.again = 1
                                }
                                
                                ShopBackgroundItem(geometry: geometry,
                                                   image: SweetImageName.heart.rawValue,
                                                   text: "X 6",
                                                   sizeW: 0.286,
                                                   sizeH: 0.161,
                                                   cost: "120") {
                                    UserDefaultsManager().updateResource(keyToUpdate: Keys.lifes, costInMoney: 120, countOfResourse: 6)
                                    sweetHeartsShopModel.again = 1
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
    SweetHeartsShopView()
}

