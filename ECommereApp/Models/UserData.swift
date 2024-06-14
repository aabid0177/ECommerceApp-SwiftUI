//
//  UserData.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import Foundation
// MARK: - Welcome
struct UserData: Codable {
    let address: Address
    let id: Int
    let email, username, password: String
    let name: NameModal
    let phone: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case address, id, email, username, password, name, phone
        case v = "__v"
    }
}

struct UserDataUpdateProfile: Codable {
    let address: AddressUpdateProfile
    let email: String
    let name: NameModal
    let phone: String

    enum CodingKeys: String, CodingKey {
        case address, email, name, phone
    }
}

// MARK: - Address
struct Address: Codable, DictionaryConvertor {
    let geolocation: Geolocation
    let city, street: String
    let number: Int
    let zipcode: String
}

struct AddressUpdateProfile: Codable, DictionaryConvertor {
    let geolocation: Geolocation
    let city, street: String
    let num: String
    let zipcode: String
    
    enum CodingKeys: String, CodingKey {
        case geolocation, city, street, zipcode
        case num = "number"
    }
}

// MARK: - Geolocation
struct Geolocation: Codable, DictionaryConvertor {
    let lat, long: String
}

// MARK: - Name
struct NameModal: Codable, DictionaryConvertor {
    let firstname, lastname: String
}
