//
//  Detail.swift
//  Stylish
//
//  Created by Aabid Khan on 09/05/24.
//

import SwiftUI

struct Detail: View {
    var productId: String?
    @Environment(\.dismiss) var dismiss
    @State private var product: Product?
    @State private var cartText: String = "ADD TO CART"
    @EnvironmentObject private var order: Order
    @State private var pushToAnotherScreen: Bool = false
    @ObservedObject private var viewModel = ProductDetailViewModel()
    
    private var isAddedToCart: Bool {
        return order.isProductAddedToCart(productId: viewModel.product?.id ?? 0)
    }
    
    private func addItemToCart() {
        if let product = viewModel.product {
            order.add(product: OrderProduct(id: product.id, title: product.title, price: product.price, description: product.description, category: product.category, image: product.image, rating: product.rating))
            cartText = "GO TO CART"
        }
    }
    
    private var isCartEmpty: Bool {
        order.products.count == 0
    }
    
    var body: some View {
        
        ScrollView {
            if let product = viewModel.product {
                VStack(alignment: .leading) {
                    ImageSliderDetail(images: [product.image, "https://c1.wallpaperflare.com/preview/336/692/939/shirt-colour-clothing-fashion.jpg", "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg", "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg", "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg"], cornerRadius: 16)
                        .frame(height: K.Size.heightInProportionOfScreen(height: 235))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        SizeButtons()
                        
                        Text(product.title)
                            .font(.custom(K.Fonts.themeSemiBold, size: 20))
                        
                        Text(product.title)
                            .font(.custom(K.Fonts.themeRegular, size: 14))
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            RatingView(rate: product.rating?.rate)
                            Text("56,890")
                                .font(.custom(K.Fonts.themeMedium, size: 14))
                                .foregroundStyle(.borderColorGray)
                        }
                        
                        HStack {
                            Text("~~₹2499~~")
                                .foregroundStyle(.borderColorGray)
                            Text("₹\(product.price, specifier: "%.2f")")
                            Text("50%Off")
                                .foregroundStyle(Color(UIColor(red: 254/255, green: 115/255, blue: 92/255, alpha: 1)))
                                .font(.custom(K.Fonts.themeSemiBold, size: 14))
                        }
                        .font(.custom(K.Fonts.themeMedium, size: 14))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Product Details")
                                .font(.custom(K.Fonts.themeMedium, size: 14))
                            
                            Text(product.description)
                                .font(.custom(K.Fonts.themeRegular, size: 12))
                                .fixedSize(horizontal: false, vertical: true)
                            
                        }
                        HStack(spacing: 8) {
                            ButtonRoundedCorner()
                            ButtonRoundedCorner(title: "VIP", icon: Image(.lock))
                            ButtonRoundedCorner(title: "Return Policy", icon: Image(.return))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Delivery")
                                .font(.custom(K.Fonts.themeSemiBold, size: 14))
                            
                            Text("Within 1 Hour")
                                .font(.custom(K.Fonts.themeSemiBold, size: 21))
                            
                        }
                        .padding(.horizontal, 26)
                        .padding(.vertical, 11)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.extraLightPink)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Spacer()
                        HStack(spacing: 10) {
                            Button(action: {
                                if isAddedToCart {
                                    pushToAnotherScreen = true
                                    return
                                }
                                addItemToCart()
                            }, label: {
                                Text(cartText)
                                    .font(.custom(K.Fonts.themeSemiBold, size: 14))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(.iconColorGray, lineWidth: 1)
                            )
                            
                            Button(action: {
                                if !isAddedToCart {
                                    addItemToCart()
                                }
                                pushToAnotherScreen = true
                            }, label: {
                                Text("PLACE ORDER")
                                    .font(.custom(K.Fonts.themeSemiBold, size: 14))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            
                            
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                    }
                    
                }
                .padding(.top, 8)
                .frame(width: K.Size.widthInProportionOfScreen(width: 343))
                .background(.white)
            } else {
                ProgressIndicator()
                    .padding()
                    .foregroundStyle(.pink)
                    .onAppear(perform: {
                        viewModel.fetchProduct(productId: productId ?? "1")
                        cartText = isAddedToCart ? "GO TO CART" : "ADD TO CART"
                    })

            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.hidden)
        .navBar(leftItem: BackButton(buttonAction: {
            dismiss()
        }), rightItem: CartButton())
        .onAppear(perform: {
            cartText = isCartEmpty ?  "ADD TO CART" : "GO TO CART"
        })
        .navigationDestination(isPresented: $pushToAnotherScreen) {
            Cart(presentSideMenu: .constant(false), isPushed: true)
        }
    }
}

#Preview {
//    Detail(product: Product(id: 1, title: "Test", price: 20.0, description: "Test desc", category: "Jwellery", image: "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg", rating: Rating(rate: 2, count: 5)))
    Detail()
        .environmentObject(Order())
}
