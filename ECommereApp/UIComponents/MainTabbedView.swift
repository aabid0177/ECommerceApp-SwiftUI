//
//  MainTabbedView.swift
//  Stylish
//
//  Created by Aabid Khan on 20/05/24.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State private var presentSideMenu: Bool = false
    @EnvironmentObject private var order: Order
    
    var body: some View {
        ZStack {
            NavigationStack {
                TabView {
                    Home(presentSideMenu: $presentSideMenu)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag(0)
                        
                    WishList(presentSideMenu: $presentSideMenu)
                        .tabItem {
                            Label("Wishlist", systemImage: "heart")
                        }
                    
                    Cart(presentSideMenu: $presentSideMenu, isPushed: false)
                        .tabItem {
                            Label("Cart", systemImage: "cart")
                        }
                        .badge(order.products.count)
                    
                    SearchViewScreen(presentSideMenu: $presentSideMenu, isPushed: false)
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                }
                .tint(.pink)
                .navBar(leftItem: SideBarButton(buttonAction: {
                    presentSideMenu.toggle()
                }), title: Image(.navBar)
                    .resizable()
                    .frame(width: 112, height: 31), rightItem:  CartButton())
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: 0, presentSideMenu:  $presentSideMenu)))
        }
        
    }
}

#Preview {
    MainTabbedView()
        .environmentObject(Order())
}
