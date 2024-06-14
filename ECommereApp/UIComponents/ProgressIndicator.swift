//
//  ProgressIndicator.swift
//  Stylish
//
//  Created by Aabid Khan on 17/05/24.
//

import SwiftUI

struct ProgressIndicator: View {
    var body: some View {
        ProgressView {
            Text("Loading Data...")
                .font(.custom(K.Fonts.themeMedium, size: 12))
                .foregroundStyle(.black)
        }
        .tint(.pink)
    }
}

#Preview {
    ProgressIndicator()
}
