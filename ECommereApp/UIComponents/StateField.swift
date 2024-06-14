//
//  StateField.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import SwiftUI

struct StateField: View {
    var placeholder: String = "Select State"
    @Binding var text: String
    @Binding var cityText: String
    @FocusState var isTextFieldFocused: Bool
    let states = Bundle.main.decode(StatesList.self, from: "states-and-districts.json")
    @Binding var cities: [String]
    
    var body: some View {
        Menu {
            ForEach(states.states, id: \.state) { state in
                Button(action: {
                    
                    if text != state.state {
                        cityText = ""
                    }
                    
                    text = state.state
                    cities = state.districts
                    
                }, label: {
                    Text("\(state.state)")
                })
            }
        } label: {
            HStack(spacing: 0) {
                Text(text.isEmpty ? placeholder : text)
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
                Spacer()
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 18, height: 10)
                    .foregroundStyle(Color(K.Colors.iconColorGray))
            }
            .padding()
            .frame(height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.borderColorGray, lineWidth: 1)
            )
            .background(.white)
        }
    }
}

#Preview {
    StateField(text: .constant(""), cityText: .constant(""), cities: .constant([""]))
}
