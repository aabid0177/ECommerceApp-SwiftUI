//
//  MyOrders.swift
//  Stylish
//
//  Created by Aabid Khan on 20/05/24.
//

import SwiftUI

struct MyOrders: View {
    
    @EnvironmentObject private var order: Order
    @State private var presentSideMenu: Bool = false
    @EnvironmentObject private var vm: UserStateViewModel
    var isPushed: Bool = false
    
    func leftBarItem() -> AnyView {
        if !isPushed {
            return AnyView(SideBarButton(buttonAction: {
                presentSideMenu.toggle()
            }))
        } else {
            return AnyView(BackButton {
                order.products.removeAll()
                NavigationUtil.popToRootView(animated: true)
            })
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if order.products.count == 0 {
                        EmptyViewCustom(icon: Image(.orders), heading: "No Orders yet.", subHeading: "When you order products, they’ll appear here.")
                    } else {
                        ScrollView {
                            VStack {
                                ForEach(order.products, id: \.id) { product in
                                    CartItemView(product: product, isReadableMode: true)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .scrollIndicators(ScrollIndicatorVisibility.hidden)
                    }
                }
                .navBar(leftItem: leftBarItem(), title: Text("My Orders"))
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: 1, presentSideMenu:  $presentSideMenu)))
        }
    }
}

#Preview {
    MyOrders()
        .environmentObject(Order())
}
