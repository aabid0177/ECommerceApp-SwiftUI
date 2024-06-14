//
//  Cart.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI
import ModalPresenter

struct Cart: View {
    
    @Binding var presentSideMenu: Bool
    @EnvironmentObject private var order: Order
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: UserStateViewModel
    private var isCartEmpty: Bool {
        order.products.count == 0
    }
    
    @State private var showingSheet = false
    @State private var pushToAnotherScreen: Bool = false
    var isPushed: Bool = false
    
    struct navigationBar: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
    
    var body: some View {
      //  NavigationStack {
            VStack {
                if order.products.count == 0 {
                    EmptyViewCustom(icon: Image(.cart), heading: "Your Cart Is Empty!", subHeading: "When you add products, they’ll appear here.")
                } else {
                    ScrollView {
                        VStack {
                            ForEach(order.products, id: \.id) { product in
                                CartItemView(product: product)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                    
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Order Payment Details")
                                .font(.custom(K.Fonts.themeMedium, size: 17))
                                .padding()
                                .padding(.bottom, 8)
                            
                            HStack {
                                Text("Order Amount")
                                    .font(.custom(K.Fonts.themeRegular, size: 16))
                                
                                Spacer()
                                Text("₹")
                                Text("\(order.total, specifier: "%.2f")")
                                    .font(.custom(K.Fonts.themeSemiBold, size: 16))
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Convenience")
                                    .font(.custom(K.Fonts.themeRegular, size: 16))
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                    Text("Apply Coupon")
                                        .font(.custom(K.Fonts.themeSemiBold, size: 14))
                                        .foregroundStyle(.pink.opacity(isCartEmpty ? 0.5 : 1))
                                })
                            }
                            .padding(.horizontal)
                            .disabled(isCartEmpty)
                            
                            HStack {
                                Text("Delivery Fee")
                                    .font(.custom(K.Fonts.themeRegular, size: 14))
                                Spacer()
                                Text("Free")
                                    .font(.custom(K.Fonts.themeSemiBold, size: 14))
                                    .foregroundStyle(.pink)
                            }
                            .padding(.bottom)
                            .padding(.horizontal)
                            
                            Divider()
                                .padding(.bottom)
                                .padding(.horizontal)
                            
                            HStack {
                                Text("Order Total")
                                    .font(.custom(K.Fonts.themeMedium, size: 17))
                                
                                Spacer()
                                Text("₹")
                                Text("\(order.total, specifier: "%.2f")")
                                    .font(.custom(K.Fonts.themeSemiBold, size: 16))
                            }
                            .padding(.horizontal)
                            Spacer()
                            
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("₹ ") +
                                    Text("\(order.total, specifier: "%.2f")")
                                        .font(.custom(K.Fonts.themeSemiBold, size: 16))
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("View Details")
                                            .font(.custom(K.Fonts.themeSemiBold, size: 12))
                                            .foregroundStyle(.pink.opacity(isCartEmpty ? 0.5 : 1))
                                    })
                                }
                                .padding(.top)
                                .disabled(isCartEmpty)
                                
                                Spacer()
                                
                                Button(action: {
                                    showingSheet = true
                                }, label: {
                                    Text("Place Order")
                                        .foregroundStyle(.white)
                                        .font(.custom(K.Fonts.themeSemiBold, size: 17))
                                })
                                .padding()
                                .background(.pink.opacity(isCartEmpty ? 0.5 : 1.0))
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .frame(height: K.Size.heightInProportionOfScreen(height: 48))
                                .disabled(isCartEmpty)
                                .presentModal(isPresented: $showingSheet) {
                                    pushToAnotherScreen = true
                                    //vm.currentScreen = .myOrders
                                } content: {
                                    SuccessPopup(isPresented: $showingSheet)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .roundedCorner(24, corners: [.topLeft, .topRight])
                            .overlay (
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 24,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 24),
                                                       style: .continuous)
                                .stroke(.lightGray, lineWidth: 1).ignoresSafeArea(edges: .bottom)
                            )
                        }
                    }
                    .onAppear(perform: {
                        order.updateTotal()
                    })
                }
            }
            .navigationBarBackButtonHidden()
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                if isPushed {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButton {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Cart")
                            .font(.custom(K.Fonts.themeSemiBold, size: 16))
                    }
                }
            }
            .navigationDestination(isPresented: $pushToAnotherScreen) {
                MyOrders(isPushed: true)
            }
        //}
    }
}

#Preview {
    Cart(presentSideMenu: .constant(false))
        .environmentObject(Order())
}
