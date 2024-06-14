//
//  Profile.swift
//  Stylish
//
//  Created by Aabid Khan on 22/05/24.
//

import SwiftUI
import CoreLocation
import MapKit

struct Profile: View {
    
    @State private var presentSideMenu: Bool = false
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var dob: Date = Date()
    @State private var gender: String = ""
    @State private var phoneNumber: String = ""
    @State private var phoneCode: String = "+91"
    @State private var pincode: String = ""
    @State private var street: String = ""
    @State private var state: String = ""
    @State private var city: String = ""
    @State private var cities: [String] = [String]()
    @State private var user: UserData?
    @State private var isLoading: Bool = false
    @State private var showAlert: Bool = false
    @ObservedObject private var viewModel = UserViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if let _ = viewModel.user {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 16) {
                                ProfilePicView()
                                    .frame(maxWidth: .infinity)
                                    .padding(.bottom, 10)
                                
                                Section {
                                    NormalTextField(placeholderText: "Full Name", text: $fullname)
                                    EmailTextField(placeholderText: "Email Address", text: $email, showIcon: false, textfieldBGColor: .white)
                                    DOBTextfield(placeholderText: "", birthday: $dob)
                                    GenderTextfield(text: $gender)
                                    PhoneNumberTextfield(text: $phoneNumber, phoneCode: $phoneCode)
                                } header: {
                                    Text("Personal Details")
                                        .font(.custom(K.Fonts.themeSemiBold, size: 14))
                                }
                                
                                Spacer()
                                Divider()
                                Spacer()
                                
                                Section {
                                    NormalTextField(placeholderText: "Pincode", text: $pincode)
                                    NormalTextField(placeholderText: "Street", text: $street)
                                    StateField(text: $state, cityText: $city, cities: $cities.animation())
                                    if cities.count > 0 {
                                        CityField(text: $city, cities: cities)
                                    }
                                    
                                } header: {
                                    Text("Address Details")
                                        .font(.custom(K.Fonts.themeSemiBold, size: 14))
                                }
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 8)
                            .frame(width: K.Size.widthInProportionOfScreen(width: 327))
                        }
                        .scrollIndicators(.hidden)
                        .alert("Profile Updated!", isPresented: $showAlert, actions: {
                        }, message: {
                            Text("Your profile data has been updated")
                        })
                        
                    } else {
                        ProgressView()
                            .onAppear(perform: {
                                viewModel.fetchUser(userId: "1") {
                                    fullname = (viewModel.user?.name.firstname ?? "") + " " + (viewModel.user?.name.lastname ?? "")
                                    email = viewModel.user?.email ?? ""
                                    phoneNumber = viewModel.user?.phone ?? ""
                                    pincode = viewModel.user?.address.zipcode ?? ""
                                    street = viewModel.user?.address.street ?? ""
                                }
                            })
                    }
                }
                .navBar(leftItem: SideBarButton(buttonAction: {
                    presentSideMenu.toggle()
                }), title: Text("Profile"), rightItem: viewModel.user != nil ? Button(action: {
                    
                    let address = Address(geolocation: Geolocation(lat: "", long: ""), city: city, street: street, number: 1, zipcode: pincode).toDictionary()
                    
                    let name = NameModal(firstname: fullname, lastname: "").toDictionary()
                    
                    let finalDict: [String: Any] = ["address": address, "name" : name, "email": email, "phone": phoneNumber]
                    isLoading = true
                    viewModel.updateUser(userId: "1", parameters: finalDict) {
                        isLoading = false
                        showAlert = true
                    }
                }, label: {
                    if isLoading {
                        ProgressView()
                            .tint(.pink)
                    } else {
                        Text("Save")
                            .font(.custom(K.Fonts.themeMedium, size: 16))
                            .foregroundStyle(.pink)
                    }
                    
                }) : nil)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: 2, presentSideMenu:  $presentSideMenu)))
        }
    }
}

#Preview {
    Profile()
}
