//
//  SizeButton.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI

struct SizeButtons: View {
    
    @State var selectedSize: Int? = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Size: \(selectedSize ?? 0)UK")
                .font(.custom(K.Fonts.themeSemiBold, size: 14))
            
            HStack(spacing: 10) {
                ForEach(6...10, id: \.self) { number in
                    Button(action: {
                        selectedSize = number
                    }, label: {
                        Text("\(number) UK")
                    })
                    .padding(.all, 8)
                    .frame(width: 60, height: 32)
                    .foregroundStyle(selectedSize == number ? .white : .lightPink)
                    .background(selectedSize == number ? .lightPink : .white)
                    .font(.custom(K.Fonts.themeSemiBold, size: 14))
                    .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.lightPink, lineWidth: 1)
                    )
                }
            }
        }
        
    }
}

#Preview {
    SizeButtons()
}
