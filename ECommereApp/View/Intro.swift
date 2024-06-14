//
//  Intro.swift
//  ECommereApp
//
//  Created by Aabid Khan on 02/05/24.
//

import SwiftUI

struct ButtonNextPrevText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(K.Fonts.themeSemiBold, size: 18))
    }
}

struct Intro: View {
    
    @State private var selectedTab = 0
    @State private var selectedTabStr = "0"
    @EnvironmentObject private var vm: UserStateViewModel
    
    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Group {
                        Text("\(selectedTab + 1)")
                        +
                        Text("/\(introDataArray.count)")
                            .foregroundStyle(Color(Color.RGBColorSpace.sRGB, red: 160 / 255, green: 160 / 255, blue: 160 / 255, opacity: 1))
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing)
                    .modifier(ButtonNextPrevText())
                    
                    Button(action: {
                        vm.isIntroSkipped = true
                    }, label: {
                        Text("Skip")
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                    .modifier(ButtonNextPrevText())
                    .foregroundStyle(.black)
                }
                
                ZStack(alignment: .bottom) {
                     
                    TabView(selection: $selectedTabStr) {
                        ForEach(Array(introDataArray.enumerated()), id: \.element.id) { index, item in
                            IntroContentView(data: item)
                                .tag("\(index)")
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .animation(.easeOut(duration: 0.2), value: selectedTab)
                    .onChange(of: selectedTabStr) {
                        selectedTab = Int(selectedTabStr) ?? 0
                    }
                    HStack() {
                        
                        if selectedTab > 0 {
                            Button(action: {
                                selectedTab -= 1
                                selectedTabStr = String(selectedTab)
                            }, label: {
                                Text("Prev")
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .modifier(ButtonNextPrevText())
                            .foregroundStyle(Color(Color.RGBColorSpace.sRGB, red: 196 / 255, green: 196 / 255, blue: 196 / 255, opacity: 1))
                        }
                       
                        
                        Button(action: {
                            if selectedTab < introDataArray.count - 1 {
                                selectedTab += 1
                                selectedTabStr = String(selectedTab)
                            } else {
                                vm.isIntroSkipped = true
                            }
                        }, label: {
                            selectedTab == introDataArray.count - 1 ? Text("Get Started") : Text("Next")
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                        .modifier(ButtonNextPrevText())
                        .foregroundStyle(Color(.pink))
                    }
                    .padding(.bottom, 15)
                }
            }
    }
}

#Preview {
    Intro().environmentObject(AppRootManager())
}
