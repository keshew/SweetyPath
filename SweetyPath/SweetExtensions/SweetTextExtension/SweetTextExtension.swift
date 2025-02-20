import SwiftUI

extension Text {
    func Bowlby(size: CGFloat,
                color: Color = .white,
              outlineWidth: CGFloat = 1,
               colorOutline: Color = Color(red: 250/255, green: 40/255, blue: 85/255)) -> some View {
        self.font(.custom("BowlbyOneSC-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
            .shadow(color: Color(red: 148/255, green: 12/255, blue: 59/255), radius: 3, y: 3)
    }
    
   
}

