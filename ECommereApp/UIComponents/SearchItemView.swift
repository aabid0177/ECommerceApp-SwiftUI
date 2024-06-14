//
//  SearchItemView.swift
//  Stylish
//
//  Created by Aabid Khan on 27/05/24.
//

import SwiftUI
import Kingfisher

struct SearchItemView: View {
    
    let product: Product
    
    var body: some View {
        NavigationLink {
            Detail(productId: "\(product.id)")
        } label: {
            HStack {
                KFImage( URL(string: product.image) )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                
                VStack(alignment: .leading) {
                    Text(product.title)
                        .font(.custom(K.Fonts.themeSemiBold, size: 14))
                        .multilineTextAlignment(.leading)
                    Text("₹ \(product.price, specifier: "%.2f")")
                        .font(.custom(K.Fonts.themeMedium, size: 12))
                }
                
                Spacer()
                Image(.rightArrow)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    SearchItemView(product: Product(id: 1, title: "", price: 2.0, description: "", category: "", image: "", rating: nil))
}
