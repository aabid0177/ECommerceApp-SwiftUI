//
//  SocialLoginButtonView.swift
//  Stylish
//
//  Created by Aabid Khan on 06/05/24.
//

import SwiftUI
import GoogleSignIn
struct SocialLoginButtonView: View {
    
    var message: String = "Create An Account"
    var linkButtonText: String = "Sign Up"
    @Binding var socialToken: String
    
    var body: some View {
        VStack {
            Text("- OR Continue with -")
                .font(.custom(K.Fonts.themeMedium, size: 12))
                .foregroundStyle(Color(K.Colors.textColorGray))
            HStack(spacing: 10) {
                SocialLoginButton(socialImage: Image(.google), socialToken: $socialToken)
                SocialLoginButton(socialImage: Image(.apple), socialToken: $socialToken)
                SocialLoginButton(socialImage: Image(.facebook), socialToken: $socialToken)
            }
            .padding(.top, 20)
            .padding(.bottom, 30)
            .onOpenURL { url in
                GIDSignIn.sharedInstance.handle(url)
            }
            
            HStack (alignment: .center, spacing: 5){
                Text(message)
                    .font(.custom(K.Fonts.themeRegular, size: 14))
                    .foregroundStyle(Color(K.Colors.textColorGray))
                
            Button(action: {
                
            }, label: {
                Text(linkButtonText)
                    .underline(color: Color(K.Colors.pink))
                    .font(.custom(K.Fonts.themeSemiBold, fixedSize: 14))
                    .foregroundStyle(Color(K.Colors.pink))
            })
            }
            
        }
    }
}

#Preview {
    SocialLoginButtonView(socialToken: .constant(""))
}
