//
//  ImageSliderView.swift
//  Stylish
//
//  Created by Aabid Khan on 13/05/24.
//

import SwiftUI
import Kingfisher

struct ImageSlider: View {
    
    // 1
    private let images = ["1", "2", "3"]
    @State private var selectedTabIndex = 0
    
    var body: some View {
        // 2
        VStack(spacing: 12) {
            TabView(selection: $selectedTabIndex) {
                ForEach(Array(images.enumerated()), id: \.element) { index, item in
                    Image(item)
                       .resizable()
                       .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle())
            
            CustomPageControl(numberOfPages: images.count, currentPage: $selectedTabIndex)
        }
       
    }
}

struct ImageSliderDetail: View {
    
    // 1
    let images: [String]
    var cornerRadius: CGFloat = 0
    @State private var selectedTabIndex = 0
    
    var body: some View {
        // 2
        VStack(spacing: 12) {
            TabView(selection: $selectedTabIndex) {
                ForEach(Array(images.enumerated()), id: \.element) { index, item in
                    KFImage(URL(string: item))
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .frame(width: K.Size.widthInProportionOfScreen(width: 343), height: K.Size.heightInProportionOfScreen(height: 213))
                    .tag(index)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle())
            .animation(.spring(), value: UUID())
            CustomPageControl(numberOfPages: images.count, currentPage: $selectedTabIndex, selectedColor: .pink)
        }
       
    }
}
struct ImageSliderDetail_Previews: PreviewProvider {
    static var previews: some View {
        // 4
        ImageSliderDetail(images: ["https://c1.wallpaperflare.com/preview/336/692/939/shirt-colour-clothing-fashion.jpg"])
        
//    https://c1.wallpaperflare.com/preview/336/692/939/shirt-colour-clothing-fashion.jpg
    }
}
