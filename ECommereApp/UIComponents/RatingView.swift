//
//  RatingView.swift
//  Stylish
//
//  Created by Aabid Khan on 14/05/24.
//

import SwiftUI

struct RatingView: View {
    let rate: Double?
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { number in
                let star = "star.fill"
                let starColor = number <= Int(rate ?? 0) ? Color.ratingStarYellow : .lightGray
                Image(systemName: star)
                     .resizable()
                     .frame(width: 14, height: 14)
                     .foregroundStyle(starColor)
                }
            
        }
    }
}

#Preview {
    RatingView(rate: 3.0)
}
