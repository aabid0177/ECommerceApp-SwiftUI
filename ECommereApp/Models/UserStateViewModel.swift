//
//  UserStateViewModel.swift
//  Stylish
//
//  Created by Aabid Khan on 09/05/24.
//

import Foundation
import SwiftUI

class UserStateViewModel: ObservableObject {
    
    var data: LoginResponse?
    
    @Published var isLoggedIn = false
    @Published var isIntroSkipped = false
    
    @Published var currentScreen: eAppRoots = .home
    @Published var selectedTabIndex: Int = 0
    
    enum eAppRoots {
        case home
        case myOrders
        case profile
    }
    
    init() {
        if let tdata = UserDefaults.standard.dictionary(forKey: "user") {
            data = LoginResponse(token: tdata["token"] as? String ?? "")
            isLoggedIn = true
        }
    }
    
    func save(loginData: LoginResponse?) {
        data = loginData
        isLoggedIn = true
        UserDefaults.standard.set(data?.toDictionary(), forKey: "user")
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "user")
        isLoggedIn = false
        isIntroSkipped = true
    }
}
