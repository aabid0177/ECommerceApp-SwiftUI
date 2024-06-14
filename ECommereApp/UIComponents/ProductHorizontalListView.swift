//
//  ProductHorizontalListView.swift
//  Stylish
//
//  Created by Aabid Khan on 14/05/24.
//

import SwiftUI

struct ProductHorizontalListView: View {
    
    let products: [Product]
    var hideRating: Bool = false
    var selectedProduct: ((_ product: Product) -> ())?
    var body: some View {
        if products.count == 0 {
            ProgressIndicator()
        } else {
            GeometryReader { geo in
                ZStack(alignment: .trailing) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 12) {
                            ForEach(products) { product in
                                if hideRating {
                                    ProductCardWithOutRating(product: product)
                                        .frame(width: (geo.size.width - 12) * 0.50)
                                } else {
                                    ProductCard(product: product, selectedProduct: selectedProduct)
                                        .frame(width: (geo.size.width - 12 ) * 0.50)
                                }
                            }
                        }
                        .background(.clear)
                    }

                    Button(action: {
                       
                    }, label: {
                        Image(systemName: "chevron.forward")
                            .padding()
                            .background(Color.lightGray)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.black)
                    })
                    .padding(.trailing, 9)
                }
            }
        }
        
    }
}

#Preview {
    ProductHorizontalListView(products: [Product(id: 1, title: "", price: 2.0, description: "", category: "", image: "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg", rating: Rating(rate: 2.0, count: 3))])
}
