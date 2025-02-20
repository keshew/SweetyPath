import SwiftUI

struct SweetIpgradesShopView: View {
    @StateObject var sweetIpgradesShopModel =  SweetIpgradesShopViewModel()
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
                            
                            Text("Upgrades")
                                .Bowlby(size: 20, outlineWidth: 0.6)
                        }
                        
                        Spacer(minLength: 60)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 204/255, green: 1/255, blue: 155/255))
                                .cornerRadius(13)
                            
                                .overlay {
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(.white, lineWidth: 2)
                                }
                            
                            VStack {
                                Text("TIMER")
                                    .Bowlby(size: 30)
                                
                                Text("INCREASE YOUR TIME TO\n 30 SECONDS")
                                    .Bowlby(size: 15)
                                    .minimumScaleFactor(0.3)
                                    .multilineTextAlignment(.center)
                                
                                HStack(spacing: 10) {
                                    Image(.upgrade)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.377,
                                               height: geometry.size.height * 0.194)
                                    
                                    Text("X 1")
                                        .Bowlby(size: 35)
                                }
                                
                                HStack {
                                    Text("30")
                                        .Bowlby(size: 50)
                                    
                                    Image(.money)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.133,
                                               height: geometry.size.width * 0.133)
                                }
                            }
                            
                            Button(action: {
                                UserDefaultsManager().updateResource(keyToUpdate: Keys.timeCount, costInMoney: 30, countOfResourse: 1)
                                sweetIpgradesShopModel.again = 1
                            }) {
                                ZStack {
                                    Image(.wideBackButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.491,
                                               height: geometry.size.height * 0.092)
                                    
                                    Text("BUY")
                                        .Bowlby(size: 30)
                                }
                            }
                            .offset(y: geometry.size.height * 0.27)
                        }
                        .frame(width: geometry.size.width * 0.696,
                               height: geometry.size.height * 0.476)
                        .padding(.bottom, 80)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SweetIpgradesShopView()
}

