//
//  Cart.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI
import Kingfisher

struct CartItemView: View {
    
    @ObservedObject var product: OrderProduct
    @EnvironmentObject private var order: Order
    @State var showsAlert = false
    var isReadableMode = false
    
    var body: some View {
        
        HStack(spacing: 24) {
            KFImage(URL(string: product.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: K.Size.heightInProportionOfScreen(height: 153))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            VStack(alignment: .leading,spacing: 8) {
                HStack {
                    Text(product.title).font(.custom(K.Fonts.themeSemiBold, size: 16)).foregroundStyle(.black)
                    
                    if !isReadableMode {
                        Button(action: {
                            showsAlert.toggle()
                        }, label: {
                            Image(systemName: "trash")
                                .foregroundStyle(.pink)
                        })
                        .alert(isPresented: self.$showsAlert) {
                            Alert(title: Text("Remove from cart").font(.custom(K.Fonts.themeMedium, size: 14)), message: Text("Are you sure you want to remove this item from cart?").font(.custom(K.Fonts.themeMedium, size: 14)), primaryButton: .cancel(), secondaryButton: .default(Text("Yes"), action: {
                                order.remove(productToRemove: product)
                            }))
                        }
                    }
                }
                
                Text(product.category.capitalized).font(.custom(K.Fonts.themeRegular, size: 13)).foregroundStyle(.black)

                HStack(spacing: 12) {
                    Menu {
                        ForEach(product.sizeArray, id: \.self) { size in
                            Button(action: {
                                product.size = size
                            }, label: {
                                Text("\(size)")
                            })
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Text("Size")
                                .font(.custom(K.Fonts.themeRegular, size: 14))
                            Text("\(product.size)")
                                .font(.custom(K.Fonts.themeMedium, size: 14))
                            
                            if !isReadableMode {
                                Image(systemName: "chevron.down")
                                    .offset(y: -5)
                                    .font(.custom(K.Fonts.themeRegular, size: 12))
                            }
                            
                        }
                        .padding(.all, 4)
                        .background(.textfieldBackground)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .disabled(isReadableMode)
                    
                    Menu {
                        ForEach(product.quantityArray, id: \.self) { quantity in
                            Button(action: {
                                product.quantity = quantity
                                order.updateTotal()
                            }, label: {
                                Text("\(quantity)")
                            })
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Text("Qty")
                                .font(.custom(K.Fonts.themeRegular, size: 14))
                            Text("\(product.quantity)")
                                .padding(.horizontal, 4)
                                .font(.custom(K.Fonts.themeMedium, size: 14))
                            if !isReadableMode {
                                Image(systemName: "chevron.down")
                                    .offset(y: -5)
                                    .font(.custom(K.Fonts.themeRegular, size: 12))
                            }
                        }
                        .padding(.all, 4)
                        .background(.textfieldBackground)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .disabled(isReadableMode)
                }
                
                Text("₹ ")
                +
                Text("\(product.totalPrice, specifier: "%.2f")")
                    .font(.custom(K.Fonts.themeMedium, size: 14))
                Text("Delivery by ")
                    .font(.custom(K.Fonts.themeRegular, size: 13))
                +
                Text("10 May 2024")
                    .font(.custom(K.Fonts.themeSemiBold, size: 16))
            }
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 22)
//        .alert(isPresented: self.$showsAlert) {
//            Alert(title: Text("Hello"))
//        }
    }
}

#Preview {
    CartItemView(product: OrderProduct(id: 1, title: "", price: 2.0, description: "", category: "", image: "", rating: nil))
}
