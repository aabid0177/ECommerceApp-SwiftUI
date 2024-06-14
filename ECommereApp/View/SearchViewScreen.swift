//
//  SearchView.swift
//  Stylish
//
//  Created by Aabid Khan on 27/05/24.
//

import SwiftUI

struct SearchViewScreen: View {
    
    @Binding var presentSideMenu: Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var searchText: String = ""
    var isPushed: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center) {
                    if isPushed {
                        BackButton {
                            dismiss()
                        }
                        .padding(.top)
                    }
                    SearchView(searchText: $searchText, isDisableTextField: false)
                        .padding(.top, 16)
                        .shadow(radius: 2, x: 2, y: 2)
                }
                .padding(.bottom)
                .padding(.horizontal)
                .background(.white)
                
                if !searchText.isEmpty {
                    
                    let searchedProducts = viewModel.products.filter({ product in
                        product.title.localizedCaseInsensitiveContains(searchText)
                    })
                    
                    if searchedProducts.count > 0 {
                        ScrollView {
                            LazyVStack {
                                ForEach(searchedProducts) { product in
                                    SearchItemView(product: product)
                                    Divider()
                                        .padding(.vertical, 20)
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Spacer()
                        EmptyViewCustom(icon: Image(systemName: "magnifyingglass"), heading: "No result found.", subHeading: "")
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                } else {
                    Spacer()
                }
            }
            .padding(.bottom)
            .background(.white)
            .onAppear(perform: {
                viewModel.fetchAllProducts()
            })
        }
    }
}

#Preview {
    SearchViewScreen(presentSideMenu: .constant(false))
}
