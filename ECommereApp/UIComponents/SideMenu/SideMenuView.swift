//
//  SideMenuView.swift
//  Stylish
//
//  Created by Aabid Khan on 20/05/24.
//

import SwiftUI

struct SideMenuView: View {
    
    var selectedSideMenuTab: Int = -1
    @Binding var presentSideMenu: Bool
    @EnvironmentObject private var vm: UserStateViewModel
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        HStack {
            
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .pink.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            switch row.rawValue {
                            case 0:
                               
                                vm.currentScreen = .home
                                presentSideMenu.toggle()
                                break
                                
                            case 1:
                                
                                vm.currentScreen = .myOrders
                                presentSideMenu.toggle()
                                break
                                
                            case 2:
                                
                                vm.currentScreen = .profile
                                presentSideMenu.toggle()
                                break
                                
                            case 3:
                                showLogoutAlert = true
                                break
                                
                            default:
                                vm.currentScreen = .home
                            }
                        }
                        .confirmationDialog("Logout", isPresented: $showLogoutAlert, actions: {
                            Button("Logout", role: .destructive) {
                                vm.signOut()
                            }
                        })
                    }
                    
                    Spacer()
                }
                .padding(.top, 20)
                .frame(width: 270)
                .background(
                    Color.white
                )
            }
            Spacer()
        }
        .background(.clear)
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? .pink : .white)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .pink.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }
    
    enum SideMenuRowType: Int, CaseIterable {
        case home = 0
        case myOrders
        case profile
        case logout
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .myOrders:
                return "My Orders"
            case .profile:
                return "Profile"
            case .logout:
                return "Logout"
            }
        }
        
        var iconName: String{
            switch self {
            case .home:
                return "home"
            case .myOrders:
                return "orders"
            case .profile:
                return "profile"
            case .logout:
                return "logout"
            }
        }
    }
}

#Preview {
    SideMenuView(presentSideMenu: .constant(false))
}
