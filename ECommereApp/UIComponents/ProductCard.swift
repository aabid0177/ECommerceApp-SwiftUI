//
//  ProductCard.swift
//  Stylish
//
//  Created by Aabid Khan on 14/05/24.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
    
    let product: Product
    var selectedProduct: ((_ product: Product) -> ())?
    @EnvironmentObject private var wishList: WishListData
    
    var body: some View {
        NavigationLink(destination: 
                        Detail(productId: "\(product.id)")
                            .toolbar(.hidden, for: .tabBar)
        ) {
            
            VStack {
                KFImage(URL(string: product.image))
                    .resizable()
                    .scaledToFit()
                    .frame(height: K.Size.heightInProportionOfScreen(height: 124))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .font(.custom(K.Fonts.themeMedium, size: 12))
                        .padding(.top, 4)
                        .lineLimit(1)
                    Text(product.description)
                        .font(.custom(K.Fonts.themeRegular, size: 10))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Text("₹\(product.price, specifier: "%.2f")")
                        .font(.custom(K.Fonts.themeMedium, size: 12))
                    
                    HStack {
                        Text("~~₹2499~~")
                            .foregroundStyle(.borderColorGray)
                        Text("40%Off")
                            .foregroundStyle(Color(UIColor(red: 254/255, green: 115/255, blue: 92/255, alpha: 1)))
                    }
                    .font(.custom(K.Fonts.themeRegular, size: 12))
                    
                    HStack {
                        RatingView(rate: product.rating?.rate)
                        Text("56890")
                            .font(.custom(K.Fonts.themeRegular, size: 10))
                            .foregroundStyle(.borderColorGray)
                        Spacer()
                        Button(action: {
                            if wishList.isProductAddedToWishList(productId: product.id) {
                                wishList.remove(productToRemove: product)
                            } else {
                                wishList.add(product: product)
                            }
                        }, label: {
                            Image(systemName: wishList.isProductAddedToWishList(productId: product.id) ? "heart.fill" :  "heart")
                                .foregroundStyle(.pink)
                        })
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            .padding(.top, 8)
        }
        .background(.white)
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    ProductCard(product: Product(id: 1, title: "", price: 2, description: "", category: "", image: "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg", rating: Rating(rate: 2, count: 3)))
}
