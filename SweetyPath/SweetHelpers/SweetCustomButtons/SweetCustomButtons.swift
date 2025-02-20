import SwiftUI

struct LevelPin: View {
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as! Int == Int(text) ?? 0 {
            NavigationLink(destination: SweetGameView()) {
                ZStack {
                    Image(.currentLevel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.19, height: geometry.size.width * 0.19)
                    
                    Text(text)
                        .Bowlby(size: 25)
                }
            }
        } else if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as! Int > Int(text) ?? 0 {
            ZStack {
                Image(SweetImageName.doneLevel.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.19, height: geometry.size.width * 0.19)
                
                Text(text)
                    .Bowlby(size: 25)
            }
        } else {
            ZStack {
                Image(SweetImageName.lockedLevel.rawValue)
                    .resizable()
                    .frame(width: geometry.size.width * 0.19, height: geometry.size.width * 0.19)
            }
        }
    }
}

struct CustomSlider: View {
    @Binding var value: Float
    let range: ClosedRange<Float>
    let thumbSize: CGFloat = 20
    let trackHeight: CGFloat = 10
    let sizeSlider: CGFloat
    var color: Color = Color(red: 101/255, green: 255/255, blue: 218/255)
    var image: String = SweetImageName.pin.rawValue
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(red: 133/255, green: 120/255, blue: 172/255))
                    .frame(height: trackHeight)
                    .cornerRadius(8)
                
                Rectangle()
                    .fill(color)
                    .frame(width: max(0, CGFloat(normalizedValue) * geometry.size.width), height: trackHeight)
                    .cornerRadius(8)
                
                Image(image)
                    .resizable()
                    .frame(width: thumbSize, height: thumbSize)
                    .offset(x: CGFloat(normalizedValue) * (geometry.size.width - thumbSize))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                updateValue(with: gesture.location.x, in: geometry.size.width)
                            }
                    )
            }
        }
        .frame(width: sizeSlider, height: thumbSize)
    }
    
    private var normalizedValue: Float {
        return (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }
    
    private func updateValue(with locationX: CGFloat, in totalWidth: CGFloat) {
        let newValue = Float((locationX / totalWidth)) * (range.upperBound - range.lowerBound) + range.lowerBound
        value = min(max(newValue, range.lowerBound), range.upperBound)
    }
}

struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 68, height: 34)
                .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 33, height: 34)
                        .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                        .offset(x: isOn ? 35 : 0)
                        
                }
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

struct EquipedBGItem: View {
    var geometry: GeometryProxy
    var image: String
    var text: String
    var textButton: String
    var action: (() -> ())
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 204/255, green: 1/255, blue: 155/255))
                .cornerRadius(13)
                
                .overlay {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(.white, lineWidth: 2)
                }
            
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * 0.255,
                           height: geometry.size.height * 0.16)
                
                    .padding(.top)
                
                Text(text)
                    .Bowlby(size: 17)
                
                Spacer()
                
               HStack(spacing: 0) {
                   Spacer()
                   
                   Button(action: {
                       action()
                   }) {
                       ZStack {
                           Image(.wideBackButton)
                               .resizable()
                               .frame(width: geometry.size.width * 0.255,
                                      height: geometry.size.height * 0.048)
                           
                           Text(textButton)
                               .Bowlby(size: 14)
                       }
                   }
                   .padding(.trailing, 10)
               }
            }
        }
        .frame(width: geometry.size.width * 0.43,
               height: geometry.size.height * 0.285)
    }
}

struct ShopBackgroundItem: View {
    var geometry: GeometryProxy
    var image: String
    var text: String
    var sizeW: CGFloat = 0.255
    var sizeH: CGFloat = 0.16
    var cost: String = "30"
    var action: (() -> ())
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 204/255, green: 1/255, blue: 155/255))
                .cornerRadius(13)
                
                .overlay {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(.white, lineWidth: 2)
                }
            
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * sizeW,
                           height: geometry.size.height * sizeH)
                
                    .padding(.top)
                
                Text(text)
                    .Bowlby(size: 17)
                
                Spacer()
                
                HStack(spacing: 5) {
                    HStack(spacing: 0) {
                        Text(cost)
                            .Bowlby(size: 17)
                        
                        Image(.money)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .offset(y: -7)
                    
                    
                    Button(action: {
                        action()
                    }) {
                        ZStack {
                            Image(.wideBackButton)
                                .resizable()
                                .frame(width: geometry.size.width * 0.255,
                                       height: geometry.size.height * 0.048)
                            
                            Text("BUY")
                                .Bowlby(size: 14)
                        }
                    }
                }
                .offset(y: -1)
            }
        }
        .frame(width: geometry.size.width * 0.43,
               height: geometry.size.height * 0.285)
    }
}
