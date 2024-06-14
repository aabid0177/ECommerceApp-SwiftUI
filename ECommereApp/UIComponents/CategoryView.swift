//
//  CategoryView.swift
//  Stylish
//
//  Created by Aabid Khan on 10/05/24.
//

import SwiftUI

struct CategoryView: View {
    
    @ObservedObject var category: Category
    var selectCategory: ((_ categoryName: String) -> ())?
    
    var body: some View {
        Button(action: {
            selectCategory?(category.category == "All" ? "" : category.category)
            category.isSelected.toggle()
        }, label: {
            VStack {
                Image(category.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        category.isSelected ?
                            Circle()
                            .stroke(.pink, lineWidth: 3) : nil
                    )
                Text(category.category.capitalized)
                    .font(.custom(category.isSelected ? K.Fonts.themeSemiBold : K.Fonts.themeRegular, size: 10))
                    .foregroundStyle(category.isSelected ? .pink : .black)
            }
            .foregroundStyle(.black)
        })
        
        
    }
}

#Preview {
    CategoryView(category: Category(category: "asadsads", image: "category", isSelected: true))
}
