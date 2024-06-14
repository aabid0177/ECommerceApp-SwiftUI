//
//  SearchView.swift
//  Stylish
//
//  Created by Aabid Khan on 10/05/24.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    var isDisableTextField: Bool = true
    @FocusState var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
            
            TextField("Search any Product..", text: $searchText)
                .font(.custom(K.Fonts.themeRegular, size: 14))
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
                .disabled(isDisableTextField)
                .focused($isFocused)
                .onAppear(perform: {
                    isFocused = true
                })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "mic")
                    .frame(width: 24, height: 24)
            })
        }
        .padding(.horizontal, 16)
        .frame(width: K.Size.widthInProportionOfScreen(width: 343), height: 40)
        .background(.white)
        .frame(height: 40)
        .foregroundStyle(.borderColorGray)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
