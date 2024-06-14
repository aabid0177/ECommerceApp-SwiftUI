//
//  SideBarButton.swift
//  Stylish
//
//  Created by Aabid Khan on 16/05/24.
//

import SwiftUI

struct SideBarButton: View {
    
    var buttonAction: (() -> ())?
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }, label: {
            Image(.sidebar)
        })
    }
}

#Preview {
    SideBarButton()
}
