import SwiftUI

struct SweetSettingsView: View {
    @StateObject var sweetSettingsModel =  SweetSettingsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var isSetting: Bool
    @ObservedObject var audioManager = AudioManager.shared
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            isSetting = false
                        }) {
                            Image(.menu)
                                .resizable()
                                .frame(width: 62, height: 77)
                                .padding(.leading, 25)
                        }
                        
                        Spacer()
                    }
                    
                    Text("SETTINGS")
                        .Bowlby(size: 35)
                    
                    Spacer(minLength: 30)
                    
                    ZStack {
                        Image(.settingsBack)
                            .resizable()
                        .frame(width: geometry.size.width * 0.932,
                               height: geometry.size.height * 0.4825)
                        
                        VStack(spacing: 30) {
                            VStack {
                                Text("MUSIC")
                                    .Bowlby(size: 32)
                                
                                CustomSlider(value: $audioManager.backgroundVolume,
                                             range: 0...1,
                                             sizeSlider: geometry.size.width * 0.589,
                                             color: Color(red: 231/255, green: 42/255, blue: 228/255))
                          
                                Text("SOUND")
                                    .Bowlby(size: 32)
                                
                                CustomSlider(value: $audioManager.soundEffectVolume,
                                             range: 0...1,
                                             sizeSlider: geometry.size.width * 0.589,
                                             color: Color(red: 231/255, green: 42/255, blue: 228/255))
                            }
                            
                            VStack {
                                Text("VIBRATION")
                                    .Bowlby(size: 32)
                                
                                Toggle("", isOn: $sweetSettingsModel.isVibration)
                                    .toggleStyle(CustomToggle())
                            }
                        }
                        .offset(y: -10)
                        
                        Button(action: {
                            UserDefaultsManager().saveVolumeSettings(backgroundVolume: audioManager.backgroundVolume,
                                                                          soundEffectVolume: audioManager.soundEffectVolume)
                        }) {
                            ZStack {
                                Image(.wideBackButton)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.558,
                                           height: geometry.size.height * 0.105)
                                
                                Text("SAVE")
                                    .Bowlby(size: 27)
                            }
                        }
                        .offset(y: geometry.size.height * 0.27)
                    }
                    
                    Spacer(minLength: 200)
                }
            }
            
            .onAppear {
                let (backgroundVolume, soundEffectVolume) = UserDefaultsManager().loadVolumeSettings()
                audioManager.backgroundVolume = backgroundVolume
                audioManager.soundEffectVolume = soundEffectVolume
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var settin = false
    return SweetSettingsView(isSetting: $settin)
}

