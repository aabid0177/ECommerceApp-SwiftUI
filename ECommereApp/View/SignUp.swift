//
//  SignUp.swift
//  Stylish
//
//  Created by Aabid Khan on 06/05/24.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            TitleTextBig(text: "Create an account")
                .frame(width: K.Size.widthInProportionOfScreen(width: 192))
                .padding(.bottom, 36)
                
            
            EmailTextField(placeholderText: "Username or Email", text: .constant(""))
            .padding(.bottom, 31)
            
            PasswordField(placeholderText: "Password", text: .constant(""))
                .padding(.bottom, 31)
            
            PasswordField(placeholderText: "ConfirmPassword", text: .constant(""))
                .padding(.bottom, 19)
            
            Group {
                Text("By clicking the ")
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                    .foregroundStyle(Color(uiColor: .textColorGray)) +
                Text("Register")
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                    .foregroundStyle(.red) +
                Text(" button, you agree to the public offer")
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                    .foregroundStyle(Color(uiColor: .textColorGray))
            }
            .frame(width: K.Size.widthInProportionOfScreen(width: 258))
            .padding(.bottom, 38)
            
            ThemeButton(text: "Create Account", showLoader: .constant(false))
                .padding(.bottom, 40)
            SocialLoginButtonView(message: "I Already Have Account",linkButtonText: "Login", socialToken: .constant(""))
                .frame(width: UIScreen.screenWidth - 64)
         
        }
        .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight, alignment: .leading)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .padding(.top, 19)
    }
}

#Preview {
    SignUp()
}
