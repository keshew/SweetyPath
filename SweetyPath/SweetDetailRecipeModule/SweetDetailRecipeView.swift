import SwiftUI

struct SweetDetailRecipeView: View {
    @StateObject var sweetDetailRecipeModel =  SweetDetailRecipeViewModel()
    @Environment(\.presentationMode) var presentationMode
    var model: Recipe
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
                            Text("RECIPE")
                                .Bowlby(size: 35)
                        }
                        
                        VStack(spacing: 20) {
                            ZStack {
                                Image(model.image)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.792,
                                           height: geometry.size.height * 0.197)
                                
                                Text(model.name)
                                    .Bowlby(size: 20)
                                    .offset(y: 50)
                                    .frame(width: geometry.size.width * 0.765)
                                    .lineLimit(1)
                            }
                            
                            ZStack {
                                Image(.detailRecipe)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.932,
                                           height: geometry.size.height * 0.483)
                                
                                Text(model.desc)
                                    .Bowlby(size: 15)
                                    .frame(width: geometry.size.width * 0.84,
                                           height: geometry.size.height * 0.462)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let recipe = Recipe(image: SweetImageName.recipe1.rawValue, name: "hey babe", closeImage: "", isOpen: true, desc: "asdasdasdasdasdasadsadsasddasdasda")
    return SweetDetailRecipeView(model: recipe)
}

