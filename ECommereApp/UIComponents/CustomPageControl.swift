//
//  CustomPageControl.swift
//  Stylish
//
//  Created by Aabid Khan on 13/05/24.
//

import SwiftUI

struct CustomPageControl: View {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    var selectedColor = Color.lightPink
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(index == self.currentPage ? selectedColor : .lightGray)
                
                    .onTapGesture(perform: { self.currentPage = index })
            }
        }
    }
}

#Preview {
    CustomPageControl(numberOfPages: 3, currentPage: .constant(0))
}
