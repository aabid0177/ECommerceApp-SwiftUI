//
//  ApiParamsStructure.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import Foundation
struct UpdateProfileParameter: DictionaryConvertor {
    let address: [String: Any]
    let id: Int
    let email, username, password: String
    let name: [String: Any]
    let phone: String
}
