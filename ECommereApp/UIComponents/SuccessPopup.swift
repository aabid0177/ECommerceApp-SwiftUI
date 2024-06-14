//
//  SuccessPopup.swift
//  Stylish
//
//  Created by Aabid Khan on 20/05/24.
//

import SwiftUI

struct SuccessPopup: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                ZStack {
                    Image(.starSuccess)
                        .resizable()
                        .frame(width: 91, height: 91)
                    Image(.tickSuccess)
                        .resizable()
                        .frame(width: 47, height: 27)
                }
                
                Text("Order placed successfully.")
                    .font(.custom(K.Fonts.themeSemiBold, size: 14))
            }
            .padding()
            .frame(width: K.Size.widthInProportionOfScreen(width: 331), height: K.Size.heightInProportionOfScreen(height: 201))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width:UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(.black.opacity(0.3))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isPresented = false
            }
        }
        .onTapGesture {
            isPresented = false
        }
    }
}

#Preview {
    SuccessPopup(isPresented: .constant(true))
}
