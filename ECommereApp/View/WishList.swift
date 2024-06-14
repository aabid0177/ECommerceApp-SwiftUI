//
//  WishList.swift
//  Stylish
//
//  Created by Aabid Khan on 28/05/24.
//

import SwiftUI

struct WishList: View {
    
    @EnvironmentObject private var wishList: WishListData
    @Binding var presentSideMenu: Bool
    private let twoColumnGrid = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
       // NavigationStack {
            VStack {
                if wishList.products.count == 0 {
                    EmptyViewCustom(icon: Image(.emptyFolder), heading: "Your Wishlist Is Empty!", subHeading: "When you add products, they’ll appear here.")
                } else {
                    ScrollView {
                        LazyVGrid(columns: twoColumnGrid) {
                            ForEach(wishList.products) { product in
                                ProductCard(product: product)
                                    .shadow(radius: 3, y: 3)
                                    .padding(.bottom, 8)
                                    .padding(.top, 8)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
            }
            .padding(.all, 16)
//            .navBar(leftItem: SideBarButton(buttonAction: {
//                presentSideMenu.toggle()
//            }), title: Image(.navBar)
//                .resizable()
//                .frame(width: 112, height: 31), rightItem:  CartButton())
      //  }
    }
}

#Preview {
    WishList(presentSideMenu: .constant(false))
        .environmentObject(WishListData())
}
