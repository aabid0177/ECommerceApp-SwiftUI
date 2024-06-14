//
//  ProfilePicView.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import SwiftUI
import PhotosUI

struct ProfilePicView: View {
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    func profileImage() -> Image {
        avatarImage ?? Image(systemName: "person.circle")
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            profileImage()
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .clipShape(Circle())
                .foregroundStyle(.lightPink)
            
            PhotosPicker(selection: $avatarItem, matching: .images) {
                Image(systemName: "pencil.circle")
                .resizable()
                .frame(width: 32, height: 32)
                .scaledToFit()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
            }
        }
        .onChange(of: avatarItem) {
                    Task {
                        if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                            avatarImage = loaded
                        } else {
                            print("Failed")
                        }
                    }
                }
    }
}

#Preview {
    ProfilePicView()
}
