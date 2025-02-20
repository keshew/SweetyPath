import SwiftUI

struct SweetBackgroundsShopView: View {
    @StateObject var sweetBackgroundsShopModel =  SweetBackgroundsShopViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var buyModel = UserDefaultsManager()
    @State var test = 1
    let columns: [GridItem] = [
           GridItem(.flexible(), spacing: -20),
           GridItem(.flexible(), spacing: -20)
       ]
    
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
                            VStack(spacing: 20) {
                                LazyVGrid(columns: columns, spacing: 30) {
                                    ForEach(buyModel.shopItems.indices, id: \.self) { index in
                                        let item = buyModel.shopItems[index]
                                        
                                        if item.isAvailible {
                                            EquipedBGItem(geometry: geometry,
                                                          image: item.image,
                                                          text: item.text,
                                                          textButton: "EQUIP") {
                                                sweetBackgroundsShopModel.again = 1
                                                test = 1
                                                buyModel.manageShopItem(at: index)
                                            }
                                        } else if item.isSelected {
                                            EquipedBGItem(geometry: geometry,
                                                          image: item.image,
                                                          text: item.text,
                                                          textButton: "EQUIPED") {
                                                sweetBackgroundsShopModel.again = 1
                                                test = 1
                                            }
                                        } else {
                                            ShopBackgroundItem(geometry: geometry,
                                                               image: item.image,
                                                               text: item.text) {
                                                sweetBackgroundsShopModel.again = 1
                                                buyModel.manageShopItem(at: index)
                                                test = 1
                                            }
                                        }
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

