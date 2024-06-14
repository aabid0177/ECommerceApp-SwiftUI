//
//  ECommereAppApp.swift
//  ECommereApp
//
//  Created by Aabid Khan on 02/05/24.
//

import SwiftUI

@main
struct ECommereAppApp: App {
    
    @StateObject var vm = UserStateViewModel()
    @StateObject var order = Order()
    @StateObject var wishList = WishListData()
    
    var body: some Scene {
        WindowGroup {
            ApplicationSwitcher()
                .environmentObject(vm)
                .environmentObject(order)
                .environmentObject(wishList)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject private var vm: UserStateViewModel
    
    var body: some View {
        if vm.isLoggedIn {
            switch vm.currentScreen {
            case .home:
                MainTabbedView()
            case .myOrders:
                MyOrders()
            case .profile:
                Profile()
            }
        } else {
            if vm.isIntroSkipped {
                Login()
            } else {
                Intro()
            }
        }
    }
}
