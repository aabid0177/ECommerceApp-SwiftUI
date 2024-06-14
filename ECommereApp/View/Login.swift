//
//  Login.swift
//  ECommereApp
//
//  Created by Aabid Khan on 02/05/24.
//

import SwiftUI
struct Login: View {
    
    @State private var errorMessage: String = ""
    @State private var email: String = "mor_2314"
    @State private var password: String = "83r5^_"
    @EnvironmentObject var vm: UserStateViewModel
    @State private var showLoader: Bool = false
    @ObservedObject private var viewModel = UserViewModel()
    @State private var socialtokenString = ""
    
    func disableVal() -> Bool {
        
        let emailValid = (!email.isEmpty && email.isValidEmail) ? true : false
        let passwordValid = !password.isEmpty
        
        return (emailValid && passwordValid)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TitleTextBig(text: "Welcome Back!")
                .frame(width: K.Size.widthInProportionOfScreen(width: 185))
                .shadow(radius: 2, x: 2, y: 2)
                .padding(.bottom, 36)
            
            NormalTextField(placeholderText: "Username", text: $email, isUserNameField: true)
            .padding(.bottom, 31)
            
            PasswordField(placeholderText: "Password", text: $password)
                .padding(.bottom, 9)
            
            Button(action: {}, label: {
                Text("Forgot Password?")
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                    .foregroundStyle(.pink)
                    .frame(width: UIScreen.screenWidth - 64, alignment: .trailing)
            })
            .padding(.bottom, 50)
            
            ThemeButton(disable: false, text: "Login", action: {
                viewModel.Login(parameters: LoginParameters(username: email, password: password).toDictionary()) { login in
                    showLoader = false
                    vm.save(loginData: login)
                } failure: { failureMessage in
                    errorMessage = failureMessage
                    showLoader = false
                }

            }, showLoader: $showLoader)
            .alert(errorMessage, isPresented: .constant(!errorMessage.isEmpty), actions: {
                Button("Ok") {
                    errorMessage = ""
                }
            })
            .padding(.bottom, 75)
            SocialLoginButtonView(socialToken: $socialtokenString)
                .onChange(of: socialtokenString, {
                    vm.save(loginData: LoginResponse(token: socialtokenString))
                })
                .frame(width: UIScreen.screenWidth - 64)
            Spacer()
        }
        .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight, alignment: .leading)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .padding(.top, 19)
    }
}

#Preview {
    Login()
}
