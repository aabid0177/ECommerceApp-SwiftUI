//
//  ProductCardWithOutRating.swift
//  Stylish
//
//  Created by Aabid Khan on 14/05/24.
//

import SwiftUI
import Kingfisher

struct ProductCardWithOutRating: View {
    
    let product: Product
    @EnvironmentObject private var wishList: WishListData
    
    var body: some View {
        
        NavigationLink {
            Detail(productId: "\(product.id)")
                .toolbar(.hidden, for: .tabBar)
        } label: {
            VStack {
                KFImage(URL(string: product.image))
                .resizable()
                .scaledToFit()
                .frame(height: K.Size.heightInProportionOfScreen(height: 100))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.description)
                        .font(.custom(K.Fonts.themeRegular, size: 12))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    Text("₹\(product.price, specifier: "%.2f")")
                        .font(.custom(K.Fonts.themeMedium, size: 12))
                    
                    HStack {
                        Text("~~₹2499~~")
                            .foregroundStyle(.borderColorGray)
                        Text("40%Off")
                            .foregroundStyle(Color(UIColor(red: 254/255, green: 115/255, blue: 92/255, alpha: 1)))
                        Spacer()
                        Button(action: {
                            if wishList.isProductAddedToWishList(productId: product.id) {
                                wishList.remove(productToRemove: product)
                            } else {
                                wishList.add(product: product)
                            }
                        }, label: {
                            Image(systemName: wishList.isProductAddedToWishList(productId: product.id) ? "heart.fill" :  "heart")
                                .resizable()
                                .frame(width: 20, height: 18)
                                .foregroundStyle(.pink)
                        })
                    }
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .foregroundStyle(.black)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    ProductCardWithOutRating(product: Product(id: 1, title: "", price: 2, description: "", category: "", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 2, count: 3)))
}
