//
//  BackButton.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI

struct BackButton: View {
    
    var buttonAction: (() -> ())?
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }) {
            Image(systemName: "chevron.backward"
            )
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    BackButton()
}
