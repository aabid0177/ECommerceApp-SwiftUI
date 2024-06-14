//
//  CartButton.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI

struct CartButton: View {
    
    var buttonAction: (() -> ())?
    @EnvironmentObject private var order: Order
    
    var body: some View {
        NavigationLink(destination: Cart(presentSideMenu: .constant(false))) {
            ZStack(alignment: .topTrailing) {
                Image(.cart)
                if order.products.count > 0 {
                    Text("\(order.products.count)")
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                        .background(.pink)
                        .font(.custom(K.Fonts.themeMedium, size: 12))
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 1)
                        )
                }
            }
        }
    }
}

#Preview {
    CartButton()
}
