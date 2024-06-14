//
//  Home.swift
//  Stylish
//
//  Created by Aabid Khan on 09/05/24.
//

import SwiftUI

struct Home: View {
    
    
    @State private var sort: Bool = false
    @State private var selectedCategoryName = ""
    
    @Binding var presentSideMenu: Bool
    @State private var presentSeachScreen: Bool = false
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        // NavigationStack {
        ScrollView {
            VStack(spacing: 16) {
                Button {
                    presentSeachScreen = true
                } label: {
                    SearchView(searchText: .constant(""))
                        .padding(.top, 16)
                }
                .fullScreenCover(isPresented: $presentSeachScreen, content: {
                    SearchViewScreen(presentSideMenu: .constant(false))
                })
                
                HStack {
                    Text("All Featured")
                        .font(.custom(K.Fonts.themeSemiBold, size: 18))
                    Spacer()
                    Button(action: {
                        sort.toggle()
                        sort ? viewModel.fetchAllProductsSort() : viewModel.fetchAllProducts()
                    }, label: {
                        HStack {
                            Text("Sort")
                                .font(.custom(K.Fonts.themeRegular, size: 12))
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable()
                                .frame(width:17, height: 13)
                        }
                        .padding(.all, 8)
                        .frame(height: 24)
                        .background(sort ? .lightPink : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .foregroundStyle(sort ? .white : .black)
                        
                    })
                }
                .frame(height: 24)
                
                if viewModel.categories.count == 0 {
                    ProgressIndicator()
                        .onAppear(perform: {
                            if viewModel.categories.count == 0 {
                                viewModel.fetchAllCategories()
                            }
                        })
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            if viewModel.categories.count > 0 {
                                CategoryView(category: Category(category: "All", image: "category", isSelected: selectedCategoryName.isEmpty ? true : false)) { categoryName in
                                    selectedCategoryName = categoryName
                                    viewModel.fetchAllProducts()
                                }
                            }
                            ForEach(Array(viewModel.categories.enumerated()), id: \.1) { index, name in
                                CategoryView(category: Category(category: name, image: "category\(index)", isSelected: selectedCategoryName == name ? true : false)) { categoryName in
                                    selectedCategoryName = categoryName
                                    viewModel.fetchGetInCategory(categoryName: categoryName)
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                    .padding(.all, 8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                }
                
                VStack {
                    ImageSlider()
                }
                .frame(width: K.Size.widthInProportionOfScreen(width: 343), height: K.Size.heightInProportionOfScreen(height: 220))
                
                
                DealOfTheDayView()
                    .padding(.vertical, 7)
                
                ProductHorizontalListView(products: viewModel.products)
                .frame(height: K.Size.heightInProportionOfScreen(height: 241))
                
                SpecialOffer()
                
                DealOfTheDayView(bgColor: .dealViewBGPink, primaryText: "Trending Products ", secondaryText: "Last Date 29/02/22", icon: Image(systemName: "calendar"))
                
                ProductHorizontalListView(products: viewModel.products, hideRating: true)
                    .frame(height: K.Size.heightInProportionOfScreen(height: 186))
                SummerSale()
                SponsoredCard()
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .frame(width: UIScreen.screenWidth)
            .background(Color(.textfieldBackground))
        }
        //            .navBar(leftItem: SideBarButton(buttonAction: {
        //                presentSideMenu.toggle()
        //            }), title: Image(.navBar)
        //                .resizable()
        //                .frame(width: 112, height: 31), rightItem:  CartButton())
        .onAppear(perform: {
            if viewModel.products.count == 0 {
                viewModel.fetchAllProducts()
            }
        })
        // }
    }
}

#Preview {
    Home(presentSideMenu: .constant(false))
        .environmentObject(Order())
        .environmentObject(WishListData())
}
