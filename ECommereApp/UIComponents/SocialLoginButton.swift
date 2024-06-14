//
//  SocialLoginButton.swift
//  Stylish
//
//  Created by Aabid Khan on 06/05/24.
//

import SwiftUI
import GoogleSignIn
enum SignInType {
    case google
    case facebook
    case apple
}
struct SocialLoginButton: View {
    var socialImage: Image
    let signType: SignInType = .google
    @Binding var socialToken: String
    
    func googleSignIn() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            if let token = result?.user.accessToken.tokenString {
                socialToken = token
            }
        }
    }
    
    var body: some View {
        Button(action: {
            
            switch signType {
            case .google:
                googleSignIn()
            case .facebook:
                print("facebook clicked")
            case .apple:
                print("apple clicked")
            }
            
        }, label: {
            socialImage
        })
        .frame(width: 54, height: 54)
        .padding(.all, 5)
        .background(Color(.socialButtonBackground))
        .clipShape(Circle())
        .overlay (
            Circle()
                .stroke(Color(K.Colors.pink), lineWidth: 1)
        )
    }
}

#Preview {
    SocialLoginButton(socialImage: Image(.google), socialToken: .constant(""))
}
